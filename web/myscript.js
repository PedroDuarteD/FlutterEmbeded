 (
    function (){
        "use strict";

        window._stateSet = function(){

                window._stateSet = function(){
                    console.log("hello to flutter")
                }

                let appState = window._appState

                let valueField = document.querySelector("#value")

                let updateState = function (){
                    valueField.value = appState.count;
                }

                appState.addHandler(updateState)

                updateState()


                let incrementButton = document.querySelector("#increment")

                incrementButton.addEventListener("click",(event)=>{
                    appState.increment()
                })


                  let deButton = document.querySelector("#decrement")

                                deButton.addEventListener("click",(event)=>{
                                    appState.Decrement()
                                })

                  let btnTitle = document.querySelector("#changeTitle")

                           btnTitle.addEventListener("change",(event)=>{

                                                            appState.setTitle(event.target.value)
                                                        })

        }
    }()
)