- 基本流程
working Directory→暫存區(Staging Aera)→commit→repository→push→GitHub
- VSCODE重訂基底有衝突時，目前變更（基底），來源變更（working dir）
- 觀念：在stage裡的檔案表示與索引（index）的檔案是一致的並準備commit的檔案
	已commit與已加入stage都稱為已被索引

- git reset是針對整個commit去做移動
git checkout使用在找回個別會多個遭刪除的檔案（或回復）
- Git checkout會切換到指定的分支，但如果後面接的是檔名或路徑，Git 則不會切換分支，而是把檔案從 .git 目錄裡拉一份到目前的工作目錄。
- checkout到其他分支，要在所在分支先commit
- [git與github連結(使用ssh)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh)，ssh相關設定請看此篇
	使用https協定需用token忽略兩階段驗證    
- 存在沒有加入的檔案(untracked)，也可以提交
- git reset回復到某個版本，有mixed、soft、hard模式
- git與svn處理更名和移動的方式不一樣，svn需使用內建指令，否則log會斷掉
- git remote add：新增遠端節點
- git fetch XXXX：不會改變modified
- [Git 時光機回復版本的 2 種方法 reset & checkout](https://www.maxlist.xyz/2020/05/03/git-reset-checkout/)
- [Git: 讓你的代碼回到過去，git reset 與 git revert 的用處](https://roykwokcode.medium.com/%E8%AE%93%E4%BD%A0%E7%9A%84%E4%BB%A3%E7%A2%BC%E5%9B%9E%E5%88%B0%E9%81%8E%E5%8E%BB-git-reset-%E8%88%87-git-revert-%E7%9A%84%E7%94%A8%E8%99%95-6ba4b7545690)
- [How can I download a specific folder from a GitHub repo?](https://github.community/t/how-can-i-download-a-specific-folder-from-a-github-repo/278/1)
- clone".git"，不clone檔案內容
	```Powershell
	git clone --filter=blob:none --no-checkout git@github.com:photonstorm/phaser3-examples.git ./
	```

---

### Git GUI軟體

- [Sourcetree](https://www.sourcetreeapp.com/)：免費軟體
- [Fork](https://git-fork.com/)：商業軟體

---

### 使用案例

- 撤銷所有還沒有stage但已經track的檔案，主要是hard參數，reset有三個重要模式參數
	reset是重要指令，要熟記
	```Powershell
    git reset head^ --hard
    # 捨棄最近一次commit，回到上一次
    git reset head^
    # 修改最近一次commit註解訊息
    git commit --amend -m "新的註解訊息"
	```

- 撤銷（刪除）未追蹤的檔案
    
    ```powershell
    # 撤銷（刪除）未追蹤的檔案
    git clean -fd
    # x參數會清空gitignord檔案與目錄
    git clean -fdx
    ```
    

- 顯示資訊
    
    ```powershell
    git log
    # 查看commit做了哪些事
    git log --stat
    git status
    git log -n 5 --stat
    ```
    
- 回復所有改變過的檔案（未stage）
    
    ```powershell
    git restore .
    ```
    
- project移除git版控
    
    ```powershell
    remove-item -Recurse -Force .\.git\
    ```
    
- 將某些檔案回滾到某狀態，checkout指令是分支指令，單個檔案也是使用checkout
    
    ```powershell
    # 範例：將index.html回滾到某次commit狀態，
    git checkout 7bbde60 index.html
    ```
    
- clone一個github到本地
    
    ```powershell
    # 範例：clone pixi專案至當前目錄PixiExample，後面加depth為commit的深淺
    git clone https://github.com/pixijs/examples.git ./PixiExample --depth 1
    ```
    
- 設定檔
    
    ```powershell
    # 查看config設定檔 全域repo
    git config --global -l
    git config -l
    # 處理LF與CRLF
    git config --global core.autocrlf true
    ```
    
- 移除分支（參數-d移除已經合併，-D移除未合併）
    
    ```powershell
    git branch -d branch_name
    git branch -D branch_name
    ```
    
- 取出其他分支合併特定檔案，路徑如果是bitbash要使用反斜線
    
    ```powershell
    git checkout "源分支" "檔名相對路徑1" "檔名相對路徑2"
    ```
    
- 重建基底，rebase
    
    ```powershell
    # 撤銷重建基底工作
    git rebase --abort
    ```
    

---

### help

```powershell
git help
# 列出全部command
git help -a
# git觀念與原理
git help -g
# 以網頁開出help（較詳盡）
git help 指令
# 終端機列出可用參數
git 指令 -h
```

---

### 學習資源

- [Will 保哥：30 天精通 Git 版本控管（網頁版）](https://doggy8088.github.io/Learn-Git-in-30-days/)
- [【Git】從零開始學習 Git - 30 天的學習筆記 :: 2021 iThome 鐵人賽](https://ithelp.ithome.com.tw/users/20141010/ironman/4499)
- [高見龍：為你自己學 Git](https://gitbook.tw/)
- [Git Flow 介紹與 GitHub Flow 介紹入門教學筆記 | 學習筆記 - KD's Tech Blog 技術部落格 | KD Chang 張凱迪](https://tech.kdchang.net/2024/12/04/learning-notes-git-flow-github-flow-intro-tutorial/)
- [文章：Git 與 Github 版本控制基本指令與操作入門教學](https://blog.techbridge.cc/2018/01/17/learning-programming-and-coding-with-python-git-and-github-tutorial/)
- [Gemini 對話](https://gemini.google.com/app/db6f955a27eacc99)
- [適合初學者的簡單 Git 教程](https://nulab.com/zh-tw/learn/software-development/git-tutorial/)
- [學會 Git，加入全球最大同性交友網站！](https://kopu.chat/coding/#git)
- [Git & GitHub 教學手冊 - W3HexSchool](https://w3c.hexschool.com/git/7ca21e02)
- [鐵人賽：不熟 Git 嗎？好巧我也是，不如我們一起來學吧！](https://ithelp.ithome.com.tw/users/20162483/ironman/6374)
- [Will 保哥：30 天精通 Git 版本控管（GitHub 版）](https://github.com/doggy8088/Learn-Git-in-30-days)
- [Will 保哥：YT Git版本控管視訊](https://www.youtube.com/watch?v=E_Nd0anNI6M&list=PL_dAxk7-NoFvcn8NRVgvwX1aLh_LrGpG0)
