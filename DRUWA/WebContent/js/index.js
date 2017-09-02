/**
* 
*  CoverFlow using CSS3
* 	algo의 coverflow관련 js
*  @author: Hjörtur Elvar Hilmarsson
*  
**/
(function() {

    // Local variables
    var _index = 0,
    _coverflow = null,
    _prevLink = null,
    _nextLink = null,
    _albums = [],
    _transformName = Modernizr.prefixed('transform'),

    // Constants
    OFFSET = 70; // pixels
    ROTATION = 45; // degrees
    BASE_ZINDEX = 10; // 
    MAX_ZINDEX = 42; // 
    
    var select;

    /**
     * Get selector from the dom
     **/
    function get( selector ) {
        return document.querySelector( selector );
    };

    /**
     * Renders the CoverFlow based on the current _index
     **/
    function render() {

        // loop through albums & transform positions
        for( var i = 0; i < _albums.length; i++ ) {
 
            // before 
            if( i < _index ) {
                _albums[i].style[_transformName] = "translateX( -"+ ( OFFSET * ( _index - i  ) ) +"% ) rotateY( "+ ROTATION +"deg )";
                _albums[i].style.zIndex = BASE_ZINDEX + i;
                //_albums[i].removeClass('on');
            } 

            // current
             if( i === _index ) {
                _albums[i].style[_transformName] = "rotateY( 0deg ) translateZ( 140px )";
                _albums[i].style.zIndex = MAX_ZINDEX;
                //_albums[i].addClass('on');
            } 

             // after
            if( i > _index ) {
                _albums[i].style[_transformName] = "translateX( "+ ( OFFSET * ( i - _index  ) ) +"% ) rotateY( -"+ ROTATION +"deg )";
                _albums[i].style.zIndex = BASE_ZINDEX + ( _albums.length - i  );
                //_albums[i].removeClass('on');
            }         
        
        }

    };

    /**
     * Flow to the right
     **/
    function flowRight() {

       // check if has albums 
       // on the right side
       if( _index ) {
            _index--;
            render();
       }
      
    };

    /**
     * Flow to the left
     **/
    function flowLeft() {

        // check if has albums 
       // on the left side
       if( _albums.length > ( _index + 1)  ) {
            _index++;
            render();
       }
      
    };

    /**
     * Enable left & right keyboard events
     **/
    function keyDown( event ) {
    	
        switch( event.keyCode ) {
            case 37: flowRight(); break; // left
            case 39: flowLeft(); break; // right
        }

    };
    
    function selectQuiz(){
    	alert('click');
    };

    /**
     * Register all events 
     **/
    function registerEvents() {
        _prevLink.addEventListener('click', flowRight, false);
        _nextLink.addEventListener('click', flowLeft, false);
        document.addEventListener('keydown', keyDown, false);
    };

    /**
     * Initalize
     **/
    function init() {

        // get albums & set index on the album in the middle
        _albums = Array.prototype.slice.call( document.querySelectorAll( 'section' ));
        _index = Math.floor( _albums.length / 2 );

        // get dom stuff
        _coverflow = get('#coverflow');
        _prevLink = get('#prev');
        _nextLink = get('#next');


        // display covers
        for( var i = 0; i < _albums.length; i++ ) {
            var url = _albums[i].getAttribute("data-cover");
            _albums[i].style.backgroundImage = "url("+ url  +")";
        }

        // do important stuff
        registerEvents();
        render();

   };

    // go!
    init();

}());

//알고리즘 선택시 보여주는 화면
function select1(){
	alert('test1');
}
function select2(){
	   alert('test2');
}
function select3(){
	   alert('test3');
}
function select4(){
	   alert('test4');
}
function select5(){
	   alert('test5');
}
function select6(){
	  window.open("/DRUWA/AlgoControl?cmd=show-algo6","하노이탑","width=850, height=900, status=yes,noresize,scrollbars=yes");
}
function select7(){
	   alert('test7');
}