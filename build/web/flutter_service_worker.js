'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5f8d1eee76fd97d074f47f5909b0359d",
"assets/AssetManifest.bin.json": "5b30461df47fd587c4e08bccda1e1821",
"assets/AssetManifest.json": "e5338be4a9ff552a7ad05e7ece45cb32",
"assets/assets/asteriods/asteriod.png": "c58d38efe569d96232b3360f997cc3a9",
"assets/assets/asteriods/asteriods_belt.png": "c6466311163e668105511531f061b8b0",
"assets/assets/fonts/Anton/Anton-Regular.ttf": "055c4df4e2f8c7a4d4675cdd8fa68da0",
"assets/assets/fonts/Open_Sans/static/OpenSans-Bold.ttf": "0a191f83602623628320f3d3c667a276",
"assets/assets/fonts/Open_Sans/static/OpenSans-Medium.ttf": "dac0e601db6e3601159b4aae5c1fda39",
"assets/assets/fonts/Open_Sans/static/OpenSans-Regular.ttf": "931aebd37b54b3e5df2fedfce1432d52",
"assets/assets/images/astronaut.png": "f10d04efb6a5a2977d7118f8b51c9ad1",
"assets/assets/images/ayesha_mishree.png": "f31f07d389a39d1a0cd5646c050f2a18",
"assets/assets/images/bg.png": "a85fd8ac2f393ae13efc0700f8ee8dab",
"assets/assets/images/bg2.png": "346368158f6450ea58b228dfae1b0fdc",
"assets/assets/images/bg3.jpg": "65a1107ac96365eadb10e4fe4a7c846b",
"assets/assets/images/jawad_usman.png": "9728d37bb5434c626673e66766a8762e",
"assets/assets/images/logo.png": "39c484139fa31bb9a960d915a16a3610",
"assets/assets/images/usama_khan.png": "a06e819703a7ef0a92905e4847bf7df4",
"assets/assets/orbits/orbit_1.png": "abf9d52da5fbc4bce2e4fd1947d2a15c",
"assets/assets/orbits/orbit_2.png": "e5219d8e6f5ff617b0a42b664dbdc02b",
"assets/assets/orbits/orbit_3.png": "639db3a5d3306b4ca9cd346e97123162",
"assets/assets/orbits/orbit_4.png": "f6a0f0a18cde341e087ac925199de366",
"assets/assets/orbits/orbit_5.png": "bcd670627911907f672bdb2bc1f79c2e",
"assets/assets/orbits/orbit_6.png": "8cc11982f6b8a407e1c10b66a13ad778",
"assets/assets/orbits/orbit_7.png": "33858cf29ce286948a137b6032c4689f",
"assets/assets/orbits/orbit_8.png": "e2269dcfa0fb42c6fa78dff160e2cdb8",
"assets/assets/planets/earth.png": "011f8b0e51f1b64c9c0a96513c293964",
"assets/assets/planets/jupiter.png": "e60c0021ddc755b4697a5d5af79a113c",
"assets/assets/planets/mars.png": "7e68dbc1a57322c48e778cbd01e48f84",
"assets/assets/planets/mercury.png": "7a34a8b42607ca39ab65a91d11bad27b",
"assets/assets/planets/neptune.png": "27ddb6078ccc1802fa514aa9cf520d18",
"assets/assets/planets/saturn.png": "e9ea793c990249137d07ec96178594ac",
"assets/assets/planets/uranus.png": "65b71e3707f20350fd90586f030e162f",
"assets/assets/planets/venus.png": "efde1c94fe33c5ff663eaf74311b940e",
"assets/assets/sun.gif": "402fdb264a29a604cafb29ddffc7d5e1",
"assets/FontManifest.json": "d234753bb6e90bbf7c7f6aa394cd278e",
"assets/fonts/MaterialIcons-Regular.otf": "bfa91a95f5bc0050273b07eee5646e35",
"assets/NOTICES": "40bb8b6405cb94328ce159f8c4b7c097",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "32cc31c7f950543ad75e035fcaeb2892",
"canvaskit/canvaskit.js.symbols": "bca17e359a85b4cbf39a052e0ed2ea6a",
"canvaskit/canvaskit.wasm": "9d8371d967439267d31ccf69d74a84b0",
"canvaskit/chromium/canvaskit.js": "6a5bd08897043608cb8858ce71bcdd8a",
"canvaskit/chromium/canvaskit.js.symbols": "f1d94c7665f9cc214d14cc8866a36623",
"canvaskit/chromium/canvaskit.wasm": "43fabe6bc7693c4f1f9e911ed085dd75",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "7fb2255b944232c38d2bc3e093a61253",
"canvaskit/skwasm.wasm": "77c9091f92028540cef67187198fb333",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "1c720c57a1ebe5c644893e07435ed75a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ecce62eaea31321466bdc31a00f5a8f9",
"/": "ecce62eaea31321466bdc31a00f5a8f9",
"main.dart.js": "30e5aa5334967b21e62fed7f9014558a",
"manifest.json": "c6f127efc4e82b8c45a6a49b151c92b3",
"version.json": "618c5c747a1462a5f4fcfed72eefbb3f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
