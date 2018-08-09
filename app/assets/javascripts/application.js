// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require owl.carousel
//= require bootstrap-sprockets
//= require activestorage
//= require_tree .



class Video{
    constructor(){
        this.video = document.getElementById("html-video")
        this.progress_bar_bg = document.getElementById('progress-bar-bg')
        this.progress_bar = document.getElementById('progress-bar')
        this.volume_bar_bg = document.getElementById('volume-bar-bg')
        this.volume_bar = document.getElementById('volume-bar')
        this.update_time = this.update_time.bind(this)
        this.end = this.end.bind(this)
        this.setVolume(this.video.volume)
    }

    play(){
        this.video.play();
    }
    
    pause(){
        this.video.pause();
    }
    
    update_time(){
        let percentage = this.video.currentTime / this.video.duration;
        let width =  400 * percentage;
        this.progress_bar.style.width = width + "px";
        $('#time-passed').text(Math.ceil(this.video.currentTime)/100);
        let time_left = Math.ceil(this.video.duration - this.video.currentTime)/100 
        $('#time-left').text(time_left)
    }
    
    time_change_event(){
        this.video.addEventListener('timeupdate',this.update_time) 
    }
    
    playback(){
        this.video.currentTime = 0
        $('#time-passed').text("0.00")
    }
    
    mute(){
         this.video.muted = !this.video.muted;
    }
    
    setVolume(currentVolume){
        this.video.volume = currentVolume
        let percentage = currentVolume
        let width = 200 * percentage;
         this.volume_bar.style.width = width + "px";
         console.log(currentVolume)
    }
    
    setProgress(percent){
        let time = this.video.duration * percent;
        this.video.currentTime = time;
    }
    
    ended(){
        this.video.addEventListener("ended",this.end)
    }
    
    end(){
        this.playback();
        this.pause();
        $("#play").show();
        $("#pause").hide();
    }
}
    
 
