{{flutter_js}}
{{flutter_build_config}}

// No service worker: the preview is embedded in the campaign console and
// must show the newly deployed build on the next load, not a cached one.
// Caching is left to HTTP headers on the server.
//
// CanvasKit from this build (copied in by --no-web-resources-cdn), resolved
// against <base href>, instead of www.gstatic.com.
_flutter.loader.load({
  config: { canvasKitBaseUrl: "canvaskit/" },
});
