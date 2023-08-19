# Return URL

## Usage

Build with `flutter build web`

Open ./build/web/index.html 

Add the below lines in the <head> tag

```html
<script src="https://unpkg.com/canvaskit-wasm@0.33.0/bin/canvaskit.js"></script>
<link rel="preload" href="https://unpkg.com/canvaskit-wasm@0.33.0/bin/canvaskit.wasm" as="fetch" crossOrigin="anonymous">
```