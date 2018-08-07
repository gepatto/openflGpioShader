package ui.components;

import openfl.display.Sprite;
import openfl.display.DisplayObject;

import motion.Actuate;
//import motion.easing.Cubic;

class BaseComponent extends Sprite{

    public var enabled(default,set):Bool = true;
    private function set_enabled(_enabled:Bool){
        enabled = _enabled;
        if(_enabled){
            show();
        }else{
            hide();
        }
        return _enabled;
    }
    public function new():Void{
        super();
    }

    public function setPosition(_x:Float, _y:Float):Void{
        this.x = _x;
        this.y = _y;
    }

    public function setUniformScale(scale:Float):Void{
        this.scaleX = this.scaleY = scale;
    }

    public function show():Void{
        Actuate.stop(this);
        this.alpha = 0;
	    this.visible = true;
		Actuate.tween(this, 1, {alpha : 1} ).onComplete(showComplete,null);
    }

    public function hide():Void{
        Actuate.stop(this);
        Actuate.tween(this, 1, {alpha : 0} ).onComplete(hideComplete,null);
    }

    public function showAndFade(delay:Float = 1.5):Void{
        Actuate.stop(this);
	    this.visible = true;
        this.alpha = 1;
        Actuate.tween(this, .5, {alpha : 0} ).delay(delay);
    }

    private function showComplete():Void{

    }

    private function hideComplete():Void{
		this.visible = false;
	}

    public function alignChildToBottom( target:DisplayObject):Void{
        if(!contains(target)){
            trace("target is not a child");
            return;
        }
        target.y = (height - target.height);
    }

}