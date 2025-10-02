# step 1: 获取本腳本所在 repo 第一個哈希值
$firstCommit = git rev-list --max-parents=0 HEAD

# step 2: git reset to 第一個哈希值（一般是 first commit）
# git reset --soft $firstCommit
git reset $firstCommit

git add .

# step 3: 執行git commit，description為 "Rebuild commit"
git commit -a -m "Rebuild commit"

# step 4: 執行 git push to GitHub --force
git push --force
