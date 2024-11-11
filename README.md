# webview_julia

[![Build Status](https://github.com/congzhangzh/webview_julia/workflows/CI/badge.svg)](https://github.com/congzhangzh/webview_julia/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Julia bindings for the [webview](https://github.com/webview/webview) library, allowing you to create desktop applications with web technologies.

## Installation

```julia
using Pkg
Pkg.add("Webview")
```

## Usage

### Open a website
```julia
```julia
using Webview

wv = WebviewObj()
wv.navigate("https://julialang.org")
wv.run()
```

### Do something in webview scope
```julia
using Webview

run_webview() do w
    w.set_title("Test")
    w.navigate("https://example.com")
end
```

### Display Inline HTML:
```julia
using HTTP
using Webview

html = """
<!DOCTYPE html>
<html>
    <body>
        <h1>Hello from Julia Webview!</h1>
    </body>
</html>
"""

wv = Webview()
wv.navigate("data:text/html," * HTTP.escapeuri(html))
wv.run()
```

### Load Remote URL:
```julia
using Webview

wv = Webview()
wv.navigate("https://julialang.org")
wv.run()
```

### Julia-JavaScript Bindings:
```julia
using Webview
using HTTP

wv = Webview(true)  # Enable debug mode

# Julia functions that can be called from JavaScript
function hello()
    println("Hello from Julia!")
    return "Hello from JavaScript!"
end

function add(a, b)
    return a + b
end

# HTML content with JavaScript
html = """
<!DOCTYPE html>
<html>
<body>
    <h1>Julia-JavaScript Binding Demo</h1>
    <button onclick="hello()">Call Julia</button>
    <button onclick="add(1, 2)">Calculate 1 + 2</button>
</body>
</html>
"""

# Configure window
wv.set_title("Binding Demo")
wv.set_size(800, 600)

wv.navigate("data:text/html," * HTTP.escapeuri(html))
wv.run()
```

### Creating Standalone Executable:
```julia
using PackageCompiler

create_app(".", "compiled_app/bind_example";
    force=true,
    include_lazy_artifacts=true,
    executables=["bind_example.jl" => "bind_example"])
```

## Features

- 🚀 Create desktop applications using HTML, CSS, and JavaScript
- 📂 Load local HTML files or remote URLs
- 🔄 Bidirectional Julia-JavaScript communication
- 🖼️ Window size and title customization
- 🐛 Debug mode for development
- 💻 Cross-platform support (Windows, macOS, Linux)
- 📦 Standalone executable creation

## Development

### Project Structure
```
WebView.jl/
├── src/
│   ├── WebView.jl    # Main implementation
│   └── ffi.jl        # Foreign Function Interface
├── examples/         # Example applications
├── test/            # Unit tests
└── README.md        # Documentation
```

### Running Tests
```julia
] test WebView
```

### Release Process

1. **Test**
```bash
# Run tests
julia -e 'using Pkg; Pkg.test("webview_julia")'

# Build documentation
# julia --project=docs/ docs/make.jl
```

2. **Update Version in Project.toml**
```toml
version = "x.y.z"
```

3. Trigger register bot by commit:
```bash
git commit -m "release: vx.y.z

@JuliaRegistrator register"
git push
```

## Examples

Check the `examples/` directory for more examples:
- Basic window creation
- JavaScript interaction
- Custom HTML content
- Standalone application
- Window management

## Roadmap

- [x] Basic webview functionality
- [x] Julia-JavaScript bindings
- [x] Standalone executable support
- [ ] Prebuilt binaries for all platforms
- [ ] More comprehensive examples
- [ ] Documentation website
- [ ] Hot reload support
- [ ] Custom window decorations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
