import jquantsapi
import pandas as pd
import requests
import schedule
from tqdm import tqdm
import time
import datetime
import os

refresh_token = 'REFRESH TOKEN'
# idTokenを取得
r_post = requests.post(f"https://api.jquants.com/v1/token/auth_refresh?refreshtoken={refresh_token}")
idToken = r_post.json()["idToken"]

def job(idToken):
    '''
    上場銘柄一覧を取得し、各社の財務状況を全て取得してCSVファイルとして保存

    Arguments
    =========
    idToken: str

    Returns
    ========
    df_financial: pd.DataFrame
    '''
    headers = {'Authorization': 'Bearer {}'.format(idToken)}

    # 出力ディレクトリを設定
    output_dir = 'output'

    # 日付の取得
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')

    # 上場銘柄一覧を取得
    r = requests.get("https://api.jquants.com/v1/listed/info", headers=headers)
    if r.status_code == requests.codes.ok:
        listed_companies = pd.DataFrame(r.json()["info"]).set_index("Code")
        # 上場銘柄一覧をCSVファイルとして出力
        listed_companies.to_csv(os.path.join(output_dir, f'listed_companies_{timestamp}.csv'))
    else:
        raise Exception("Failed to fetch listed companies")
    
    # 上場銘柄一覧からMarketCodeを取得
    market_codes = listed_companies['MarketCode'].unique()

    # MarketCodeごとに財務状況csvを取得
    df_financial = pd.DataFrame()
    for market_code in market_codes:
        df = listed_companies.query('MarketCode == @market_code')
        for code in tqdm(df.index, desc=f'Fetching {market_code} financial data'):
            r = requests.get(f'https://api.jquants.com/v1/fins/statements?code={code}', headers=headers)
            if r.status_code == requests.codes.ok:
                data = r.json()
                df_financial = pd.concat([df_financial, pd.DataFrame(data['statements'])], ignore_index=True)
            else:
                print(f"Failed to fetch financial data for code: {code}")
        
        # CSVファイルとして出力
        df_financial.to_csv(os.path.join(output_dir, f'{market_code}_{timestamp}.csv'), index=False)




# 実行
job(idToken)