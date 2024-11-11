# 添加源码目录到搜索路径
# push!(LOAD_PATH, dirname(dirname(@__FILE__)))

#using webview_julia  # 使用小写包名
using webview_julia

# Create a new webview instance
wv = Webview(true)  # debug mode enabled

# Set window properties
wv.set_title("My Webview App")
wv.set_size(800, 600)

# Load content
wv.navigate("https://julialang.org")

# Run the webview
#webview_julia.run(wv) 
wv.run() 