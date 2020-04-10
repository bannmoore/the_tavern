const path = require("path");
const glob = require("glob");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

function isDevelopment(options) {
	return options.mode && options.mode === "development";
}

module.exports = (env, options) => ({
	optimization: {
		minimizer: [
			new TerserPlugin({ cache: true, parallel: true, sourceMap: false }),
			new OptimizeCSSAssetsPlugin({}),
		],
	},
	entry: {
		"./js/app.js": glob.sync("./vendor/**/*.js").concat(["./js/app.js"]),
	},
	output: {
		filename: "app.js",
		path: path.resolve(__dirname, "../priv/static/js"),
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				use: {
					loader: "babel-loader",
				},
			},
			{
				test: /\.css$/,
				include: /node_modules/,
				use: [MiniCssExtractPlugin.loader, "css-loader"],
			},
			{
				test: /\.scss$/,
				exclude: /node_modules/,
				use: [
					MiniCssExtractPlugin.loader,
					"css-loader",
					{
						loader: "sass-loader",
						options: {
							sourceMap: isDevelopment(options),
						},
					},
				],
			},
		],
	},
	plugins: [
		new MiniCssExtractPlugin({ filename: "../css/app.css" }),
		new CopyWebpackPlugin([{ from: "static/", to: "../" }]),
	],
});
