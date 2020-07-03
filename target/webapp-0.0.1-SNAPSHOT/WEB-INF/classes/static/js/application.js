//require(['https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js',
//    'https://cdn.jsdelivr.net/npm/vue'], function (Turbolinks, Vue) {

    Turbolinks.start()
    console.log("Turbolinks.start();")

    var initVue = function initVue() {
        var vueapp = new Vue({
            el: '#app',
            data: {
                isProfileMenuOpen: false,
                isProjectActionsOpen: false,
                isMobileProfileMenuOpen: false
            },
            created() {
                const handleEscape = (e) => {
                    console.log('e.key')
                    console.log(event);
                    console.log(event.key === 'Escape')
                    if (event.key === 'Esc' || event.key === 'Escape') {
                        this.isProfileMenuOpen = false
                        this.isProjectActionsOpen = false
                        isMobileProfileMenuOpen: false

                        console.log(this.isProfileMenuOpen + ", " + this.isProjectActionsOpen + ", " + this.isMobileProfileMenuOpen)
                    }
                }

                document.addEventListener('keydown', handleEscape)
            },
            methods: {

            }
        })
    }



    document.addEventListener('turbolinks:load', () => {
        console.log('turbolinks:load...')
        initVue();
        console.log("loaded vue");
    })




    /* document.addEventListener('turbolinks:start', () => {
        console.log('turbolinks:start...')
        initVue()
    }) */

    /* initVue()
    console.log('initiated in main initVue 2') */

    // View destroy as recommended by Adam Wathan here https://www.youtube.com/watch?v=If6XdbBQqmY


//})