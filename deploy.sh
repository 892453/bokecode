#确保脚本抛出遇到的错误
set -e

#生成静态文件
npm run build

#进入生成的文件
cd ./public

#发布到自定义域名
echo 'boke.aifixerpic.icu' > CNAME

git init 
git add -A
git commit -m "deploy"

# git push -f git@github.com:892453/Blog.git master:gh-pages
git push -f git@github.com:892453/zqblogs.github.io.git master:gh-pages2
cd -