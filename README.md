# Subsctime(サブスクタイム)

新商品を一定期間借りて体験し、そのまま購入することができるアプリです。<br/>


### https://subsctime.ml/

<a href="https://subsctime.ml/">
  <img width="1440" alt="スクリーンショット 2020-09-21 12 04 46" src="https://user-images.githubusercontent.com/67685979/93730311-0e1b6800-fc03-11ea-847a-eb3d5a0d91dd.png"></a>

---
### 制作背景

コロナによる社会情勢の変化が気になり、外出等を控えていたりしており、リモートワーク等が増え
ITの力でなんとか社会の動きをよくしたいと思い、<br/>
<br/>
『個人と企業を繋ぐサービス』を考えました。<br/>
<br/>
消費者は、より便利なのもを手に入れることができ、
小売業者は、人件費、仕入れ、広告にかける費用を抑えたりすることができる。
インターネットを使用することで世の中が動く仕組みを作りたいと思いこのサービスを作ることにしました。


---

### 工夫したポイント
近年、Webサービスによる情報を漏洩等を加味し
payjp のv2による非同期通信を行い、アクセスし
トークン化した情報の保存

googleAPIを利用したSNS認証でのサインアップを行い、ログイン時の煩わしさ、入力の手間を省きつつユーザビリティーを考慮した仕組みを意識いたしました。


---

### 機能一覧
* ユーザー登録、ログイン  ( devise等 ) 
* クレジット機能 ( Payjp v2 )
* 画像アップロード ( carrierwave, minimagick, fog-aws ）
* レビュー投稿 ( ajax )
* ページネーション ( kaminari )
* GoogleアカウントのSNS認証 ( omniauth )

---
### インフラ
* AWS
	* VPC
	* IAM
	* EC2
	* Route53
	* S3
	* RDS for MySQL
	* ALB

---
### バックエンド
Ruby 2.6.5<br/>
Rails 6.0.3<br/>
MariaDB 5.5.64<br/>

---
### フロントエンド
HTML <br/>
Haml <br/>
CSS <br/>
Scss <br/>
Javascript <br/>
jQuery <br/>

---
### 開発
VSCode<br/>

効率化Gems:<br/>
* carrierwave (ファイルのアップロード機能)
* mini_magick (画像加工)
* fog-aws  (AWS S3へ画像をアップロード)
* devise (認証機能)
* omniauth (OAuth SNS認証)
* payjp (オンライン決済システム)
* dotenv-rails (環境変数の管理)
* kaminari (ページネーション)

バージョン管理:<br/>
* Git
* GitHub

---
### デプロイ

Capistranoでの自動デプロイ

---
### ER図

![ER図](https://user-images.githubusercontent.com/67685979/93732802-e7166380-fc0d-11ea-80b7-82619da18450.png)

---
### クラウドアーキテクチャ


---
### 課題や今後実装したい機能

* 購入履歴
* エレベーターピッチによるプロダクトページ（20秒ほどのわかりやすい機能紹介）
* 指紋認証機能

---