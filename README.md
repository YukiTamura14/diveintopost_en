# README

文書共有がSlack依存になってしまっている状態を改善するためのアプリケーション
社内での情報共有をスムーズに進めるために開発された社内用ツール

小規模かつ社内用ツールのため、挙動確認の自動化にそれほど工数を使う必要はない、との理由から統合テスト（Feature Spec）は未実装。
ただしUser招待などのロジックテスト（Model Spec）は実装している。

## バージョン
* Ruby 2.5.1
* Ruby on Rails 5.2.0
* psql (PostgreSQL) 9.6.3

## 準備

```
$ git clone git@github.com:DiveintoCode-corp/diveintopost.git
$ cd diveintopost
$ yarn install # まだ環境にyarnが入っていなかったら
$ bundle install --path vendor/bundle
$ rails db:create db:migrate
$ rails db:seed_fu
```

## アプリケーション実行

```
$ rails s

もう一枚端末を開いて
$ bin/webpack-dev-server
```

## 開発フロー

```
$ git checkout develop
$ git checkout -b feature/issues-イシュー番号

開発を実施

開発完了後
$ git push origin feature/issues-イシュー番号

GitHub場でPull Requestを作成
レビューと修正を繰り返してマージ

新しくissueを割り振られたらgit checkout developして新たにfeatureブランチを切る
あとは臨機応変に
```

## 自分のリポジトリで行う場合

```
自分のGitHubアカウントに、空のリポジトリを作成し、cloneしたアプリケーションをpushする（folkでも可）
git remote addなどで、originという文字列と、URLを紐づける
大元のissueを見ながら自分のローカルで機能開発を進め、自分のGitHubにPullRequestを提出する
（この案件は、developブランチとfeatureブランチのみで行う形で、masterブランチはなくても構わない）
```

# README

This theme is an application to improve Slack dependency of document sharing.  
(An in-house tool developed to facilitate internal information sharing)
　
 
This time, the integration test (Feature Spec) is not implemented.  
The reason is that because this application is a small and in-house tool, we do not need to take many man-hours to automate behavior confirmation.
　
 
However, logic tests (Model Spec) such as user invitation are implemented.

## Version
* Ruby 2.5.1
* Ruby on Rails 5.2.0
* psql (PostgreSQL) 9.6.3

## Preparation

```
$ git clone git@github.com:DiveintoCode-corp/diveintopost.git
$ cd diveintopost
$ yarn install # If yarn has not been installed yet.
$ bundle install --path vendor/bundle
$ rails db:create db:migrate
$ rails db:seed_fu
```

## Application execution

```
$ rails s

※ Open another terminal window
$ bin/webpack-dev-server
```

## Development flow

```
$ git checkout develop
$ git push origin feature/issues-issue number

Implementation of development

After development is complete
$ git push origin feature/issues-issue number

Create Pull Request on GitHub
Merge after repeated review and correction

When a new issue is allocated, do git checkout develop and create a new feature branch
```

## If you use your own repository

```
Create an empty repository in your GitHub account and push a cloned application (folk is acceptable too)

Use "git remote add" to link "origin" to your own GitHub URL

While looking at the original issue, proceed with local feature development and submit a PullRequest to your GitHub
(This project is done only with the develop and feature branches. There is no need for the master branch.)
```
### Screenshots when opening the application in a browser
![スクリーンショット 2019-11-16 20 23 18](https://user-images.githubusercontent.com/35171408/68992499-a04e3380-08af-11ea-9b88-16c5a5fc0f14.png)

![スクリーンショット 2019-11-16 20 24 42](https://user-images.githubusercontent.com/35171408/68992506-acd28c00-08af-11ea-93a7-cda0e10ab000.png)

### Entity-relationship Diagram (ERD)
![スクリーンショット 2019-11-16 15 16 02](https://user-images.githubusercontent.com/35171408/68991813-31201180-08a6-11ea-9fdb-b828232d76e9.png)

### What does this application do, what kind of functions does it currently have?
i) dive into post app was developed to post your articles concerning for individual teams, creates its own team, and creates different agendas.

After you can create your own account, you become able to perform other functions like creating your own team, agenda, and team members. Team members are possible to be invited any members through email.
　
For the created article, it is possible to add comments on it.

ii)dive into post app has different functions such as the creation of article, creation of agenda and creation of article and you can edit, modify and delete it.

Creation of teams and invitation of  menbers, you can add a comment on every articles in the team you belong to, modify or delete it whenever you want. 

### Agenda.rb

inside the model agenda.rd, we have a relationship of the team and user this means that only one agenda belongs to one team and one user, also only one agenda can have many articles and if we delete any article, it can be deleted everywhere it located in dive into post-app

### Article.rb

inside this model, there is a validation of title and content which means you can’t save the null value and the length size between 1 and 100,
also there is a relationship that means only one article belongs to one user, team and Agenda. also, one article has can have many comments
we have mount_uploader that will help us to upload an image from pc.

### Assign.rb

inside assign model there is a relationship that means that only one assign belongs to one user and team

### Team.rb

inside this model, we have validation of name that means that you can’t save with null in the name field and every name it can be unique not duplicate the same name

there is also the relationship that means that only one team belongs to one owner
-one team has many assigns and if we perform delete it cause to delete everywhere it located in our app.
-one team has many members 
-one team has many agenda and article if we delete it cause to be deleted everywhere it located in the project
-mount uploader that causes to upload the image icon in team

also, we perform the function that will invite individual user member
User.rb

-device authenticatable that means that the user will be able to authenticate with a login and password that are stored in the database, the user will be able to register, update, and destroy their profiles
-there is a different relationship with the user that means that:

.only one user has many teams 
.only one user has many assign, teams, articles, agendas, and comments when we perform delete function it cause to delete everywhere located in our app
.we have mount_uploader with that allow as to upload a profile picture of the user
.also users allow performing every operation in the project like creating articles, agenda, team members and so on.
