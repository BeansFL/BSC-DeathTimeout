const deathTimeOut = Vue.createApp({
  data() {
      return {
          enable: false,
          title: "",
          text: "",
          time: 0,
          timer: null,
          audio: new Audio('/html/sound/heartbeat.mp3'),
      }
  },
  methods: {
      startNui(text, settings) {
          this.title = text.title;
          this.text = text.content;
          this.time = settings.time;
          this.enable = true
          this.deathSound(settings.sounds)
          this.startTimer()
      },
      startTimer() {
          this.timer = setInterval(() => {
              this.time--;
              if (this.time <= 0) {
                  this.endTimer()
              }
          }, 1000)
      },
      endTimer() {
          this.deathSound(false)
          this.enable = false;
          fetch(`https://${GetParentResourceName()}/finished`, {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify({})
          })
          clearInterval(this.timer);
          this.timer = null;
      },
      deathSound(bool) {
          if (bool) {
              this.audio.loop = true;
              this.audio.play()
          } else {
              this.audio.loop = false;
              this.audio.pause()
          }
      },
      eventHandler(e) {
          const data = e.data;
          switch (data.type) {
              case "startTimer":
                  this.startNui(data.text, data.settings);
                  break;
              case "stopTimer":
                  this.endTimer()
                  break;
          }
      }
  },
  mounted() {
      window.addEventListener('message', this.eventHandler);
  },
  beforeUnmount() {
      window.removeEventListener('message', this.eventHandler);
  },
}).mount('body');