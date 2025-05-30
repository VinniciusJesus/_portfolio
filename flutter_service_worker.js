'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "f0ce4c3c8bcd7bad6de67668e63069d7",
".git/config": "ceeb94f77c2866d30fc6808700b11822",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "7315e52c5ca139f513888a49980eeb62",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "50670f12a92f4aec3ba9843e8a2b368a",
".git/logs/refs/heads/gh-pages": "50670f12a92f4aec3ba9843e8a2b368a",
".git/logs/refs/remotes/origin/gh-pages": "ec8c4ed4dfe28ce6281bbc80c31e4cdd",
".git/objects/04/bf5765f97dfdeea2437aa3b37af94f42e402a9": "974b7236ac75822983f5f00aff820d95",
".git/objects/10/53bcf75d3ab0869cab106b4d85200fbe6edd7d": "31e281f0cc2fc5b91bd2dd6336266e63",
".git/objects/12/5cc67a95b2dff6fc983526f48147b27ecfa0f7": "ef982fdc8c37bc55f9074c151543e47a",
".git/objects/16/b1420dc2813bdf7a6da7c76e8caac149a1e450": "fdb5767261b59d9119505bbaa6e8a98e",
".git/objects/1d/468b85698a60041b450286f31b3264b3bbd6f7": "5c8c497111befde32ac151f14cf92f85",
".git/objects/22/0f5133ae4c051ab98b35ad5bae2c9b9d37fd34": "a93779a662a0fa872ac16c9c1e28e822",
".git/objects/2d/70e17d3e3b42ca9c563372ac35fccd69adedb8": "93964ad9dd8ffdd70505f6db16fb55d5",
".git/objects/2e/a755cf298e7745bd0c3bd7090ea8e2efba2d76": "dd9989ecb584b4b2d652b100d73c0d04",
".git/objects/30/d8ec778b7627896c068a8ef68f0e07c1db1bec": "b1d3ea599141b196d761c4a707188147",
".git/objects/32/c78968809cf980a6cbf6f521ccce69e54c2d74": "d99c3ad4f92c0da35cbab38a61f73e2f",
".git/objects/34/ea2bd5bb01aeca8d03e73378cdf78ea5e26c33": "bebc0b20598c146e8ed417b9d48e41d6",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3c/54aed9fcf4358d6a22d47ee8e5ba66d7fc38d9": "4808f145a25d8ade175f4cf88276d8fd",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/49/76fce69c4d1f9a21726146a263fe5c69a548eb": "d65cdc75fe0cef6f891b47f72f1f813b",
".git/objects/51/8675c6f6754326d71819641afb903938645fa8": "758caf108a3fdad528b189bbbc71440a",
".git/objects/51/dfe4ea4d91214f2a9751dc5c923d257bb0c0cc": "8330e775a2892c64965912867f7a87ba",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/5c/b9f1a9ec5e5035780a1cf072e9415ee73c29b9": "9a45cce865a2bc297cf0bb8b2abca106",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/6a/f9da21d4905895879fc772ca52f7893c253c64": "f089d70030875e73b793f4f0fcb54efa",
".git/objects/6e/73b99eb82546615e28a1f068f197255c76946a": "88e5ac7d566e84db7515ca0de7b1fbbd",
".git/objects/70/be6c108b238ad95e0ef5483aabaf953ca506a6": "e55fa0b52a63ac888962c0c8e4a0a85c",
".git/objects/72/3d030bc89a4250e63d16b082affe1998618c3f": "e4299c419434fc51f64a5266659918fa",
".git/objects/75/7b1baf08979fc62e48398b2cb6cb0492f95b4c": "3eeca931c02ad69f685ebc48f41dcf0d",
".git/objects/7e/a9e3e0156bb144ee454cc08342972d3411ff53": "0a9fb6ab7759b759b487b19a3a02733b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8f/c8be62f202c40e7d3e2e16242fb065cfc4e1a7": "6fda1b80da67a8d96186cf8ab8b24087",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/98/c65a9bd734754ace4aa81b283fc0627bbe0797": "e2defee94ec7374affa2ef9e6250a378",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/a8/a8a4466589002f857431e4cc0919ee722d3d25": "af18b8aa101a0a634923deb7e75c5cdc",
".git/objects/b3/f9c9272cbdcacbe4cf7511a19a7d5f26fa7bbc": "3dc83d8caf7be0ed1b74316a136ffbfd",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/bc/251dd736f4a07de280daec6c21cc18c03215bd": "1817f483532eede0eee9673168701455",
".git/objects/bd/9600b392b932b54c60bd6ef0af8c0943ac5ed8": "93be2e9bfc66b097351dc6aee227be1d",
".git/objects/c6/0716d1715b5bbccd023c29a10db66ad8c95ee6": "a15fbdf0d4f4e2cf29da04899a1313ff",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/ed3ef4effe8370812c3841fed714caab49b6d6": "b07a2e2006c41483bc34635baf97922d",
".git/objects/ee/8b72f51015219cecd5478a024d9511be2fc18d": "25d1fb7a0403804df9cd7dac17f434c5",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f5/e3fdad4bfdb515cba9eda76f94e9ce587d6cc0": "cb03ef3972465bd1695b185f7997969d",
".git/objects/f8/5f821d314175361b852518cc4e4d250cfc7255": "50f01f452f07efe4c2e17b7473de676c",
".git/objects/f8/88e0f7458556d129e88f622f9938e800ab663e": "c3a90683add19b4c324787d440807263",
".git/refs/heads/gh-pages": "1c31578deeb3fe811e6e244fa0101c0d",
".git/refs/remotes/origin/gh-pages": "1c31578deeb3fe811e6e244fa0101c0d",
"assets/AssetManifest.bin": "d70e556d1a5509b6347ad2a5e3f28c28",
"assets/AssetManifest.bin.json": "789d4ac1309060e3e86dd77acce5de3b",
"assets/AssetManifest.json": "31474360dc37e0d7e40a35b7a4edfd53",
"assets/assets/svg/achou.png": "79299bd557fdaa5b386047b1155fb8cd",
"assets/assets/svg/anotei.png": "68dcf27092a1bc229d184f89adf3a56a",
"assets/assets/svg/eu.jpg": "630d6da600de90b613c7666bf4f6d280",
"assets/assets/svg/kinsol.png": "f7cbbe8fad5bd0b5ff6dad3706aaa8ed",
"assets/assets/svg/seg.png": "e1f5a5bd3d59a74b1bb7fa2a83913f25",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "ce63d0d821fcbf6d7c321c38c1ca6602",
"assets/NOTICES": "6dc9d92a587b29800c589977eb59e949",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"fav.png": "b876b7df3420b00e5cfb85bb847254f0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "2ae41e1abcbb218044fb945518edf2ad",
"icons/fav.png": "bcc35eba70c4a5508660f59e59208ae9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "42e30544cdc7f4fd89c598e2c9ac3bff",
"/": "42e30544cdc7f4fd89c598e2c9ac3bff",
"main.dart.js": "c8527b644786c9b2d9537ff364a321d1",
"main.dart.mjs": "6ec1bbf235b246e9bea1ee815512207b",
"main.dart.wasm": "2c070f983adc80fc3eb7f4a2b81cb424",
"manifest.json": "d45359d6c6888bb281abe00d0f0843aa",
"version.json": "5acaf300ba56d18550b930163e94f1f1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
