# forum
论坛项目

#文件分类
  + a admin为项目后台
  + b my_forum为项目前端代码
  + c forum.sql为项目数据库文件

#使用教程
  1.下载三个文件包
  2.分别使用 `npm install` 安装第三方包
  3.配置数据库，查找`admin/config/index.js`下的`exports.dbConfig`更改数据库配置
  4.项目启动：
      1.admin使用`npm start`启动服务，默认3000端口。
      2.my_forum使用`npm run dev`启动
  
