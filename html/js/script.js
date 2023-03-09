const app = new Vue({
  el: '.menu',
  data: {
    enable: false,
    title: "",
    text: "", 
    time: 0,
    timer: null,
    audio: null, 
  },
  methods: {
    startTimer(title, text, time) {
      this.audio = new Audio('/html/sound/heartbeat.mp3');  // remove if you want to disable sounds
      this.audio.loop = true; // remove if you want to disable sounds
      this.audio.play() // remove if you want to disable sounds
      if( this.timer != null) return ;
      this.title = title;
      this.text = text;
      this.time = time; 
      this.enable = true  
      this.timer = setInterval( () => {
        this.time--; 
        if( this.time <= 0 ) { 
          this.endTimer()
          this.audio.loop = false; 
          this.audio.pause()  
        }
      }, 1000)
    },
    startDispatch(title, text, time) {
      if( this.timer != null) return ;
      this.title = title;
      this.text = text;
      this.time = time;
      this.enable = true

      this.timer = setInterval( () => {
        this.time--;
        if( this.time <= 0 ) {
          this.endTimer()
        }
      }, 1000)
    },
    endTimer() {
      this.enable = false;
      fetch(`https://${GetParentResourceName()}/finished`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
      })
      clearInterval(this.timer);
      this.timer = null;
    }
  },
  mounted() {
    window.addEventListener("message", async (e) => {
      const data = e.data;

      switch(data.type){
        case "startTimer":
          this.startTimer(data.title, data.text, data.time);
          break;
        case "stopTimer":

          this.endTimer() 
          if (this.audio) {  // remove if you want to disable sounds
            this.audio.loop = false; // remove if you want to disable sounds
            this.audio.pause() // remove if you want to disable sounds
          }
          break;
      }

  })
  }
})
 