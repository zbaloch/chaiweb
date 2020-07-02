require(['https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js',
    'https://cdn.jsdelivr.net/npm/vue'], function (Turbolinks, Vue) {
    Turbolinks.start();


    var initVue = function initVue() {

        var vueapp = new Vue({
            el: '#app',
            data: {
                isProfileMenuOpen: false,
                isProjectActionsOpen: false
            }
        })
    }


    window.addEventListener('load', (event) => {
        console.log('window load initVue...')
        initVue()
    });

    document.addEventListener('turbolinks:load', () => {
        console.log('turbolinks:load...')
        initVue()
    })


})