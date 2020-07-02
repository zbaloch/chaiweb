require(['https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js',
    'https://cdn.jsdelivr.net/npm/vue@2.6.11'], function () {
    Turbolinks.start();
    console.log("Turbolinks started...");
    console.log("Vue loaded...");

    var app = new Vue({
        el: '#vue-app',
        data: {
            message: 'Hello Vue!'
        }
    })
})