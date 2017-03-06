var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var version = updateVersion();
var serverFlag = false;//open wepack-server flag
var HOST = '.';
var env = process.env.NODE_ENV;
var lib = '../../resources/';
var src = './src/';
var entryArr = [src + 'main.js'];
var plugins = [
    new webpack.optimize.DedupePlugin(),
    // HtmlWebpackPlugin插件用来简化创建服务于 webpack bundle 的 HTML 文件.
    // 尤其是对于在文件名中包含了 hash 值，而这个值在每次编译的时候都发生变化的情况。
    new HtmlWebpackPlugin({
        template : src + 'index.html',
        filename : '../index.html'
    })
];

var entryObj = {
    'entry': entryArr
};

//if use webpack-dev-server
if (serverFlag) {
    HOST = 'http://localhost:8050';
}

if (env != 'development') {
    plugins.push(new webpack.optimize.UglifyJsPlugin({
        compress: {
            warnings: false
        }
    }));

    if (env == 'production') {
        HOST = '.';
    }
} else {
    [].push.apply(entryArr, ['webpack-dev-server/client?http://0.0.0.0:8050', 'webpack/hot/only-dev-server']);
    plugins.push(new webpack.HotModuleReplacementPlugin());
}
var dest = HOST + '/dist/';

function updateVersion () {
    var date = new Date;
    var version = date.getFullYear() + '' + (date.getMonth() + 1) + date.getDate();
    var hash = ~~(Math.random() * 1001);
    return version + hash;
};

module.exports = {
    //页面入口
    entry: entryObj,
    //出口文件输出配置
    output: {
        path: dest, //js位置
        publicPath: dest, //web打包的资源地址
        filename: 'bundle.js?v=' + version
    },
    // devtool: '',//'#source-map',//source map 支持
    // lib对应JSpring代码。
    watchOptions: [lib + '**.js', lib + '**.css', src + '**.js', src + '*/**.js', src + '**.css'], //监控脚本
    plugins: plugins,
    //加载器
    module: {
        loaders: [{
            test: /\.css$/,
            loader: "style-loader!css-loader"
        }, {
            test: /\.html$/,
            loader: "html-loader"
        }, {
            test: /\.tpl$/,
            loader: "text-loader"
        }, {
            test: /.*\.(png|jpg|jpe?g|ico|gif|svg)$/i,
            loaders: [
                'image-webpack?{progressive:true, optimizationLevel: 3, interlaced: false, pngquant:{quality: "65-90", speed: 4}}',
                'url-loader?limit=8192&name=images/[hash:8].[name].[ext]'
            ]
        }]
    },
    resolve: {
        extensions: ['', '.js']
    }
};