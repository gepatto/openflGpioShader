package ui.components;

import ui.components.BaseComponent;

class ColorRect extends BaseComponent{
    
    private var rectWidth  :Float;
	private var rectHeight :Float;
	private var colorAlpha  :Float;
    private var hasBorder:Bool;
    private var borderColor:UInt;
    private var borderThickness:Float;
    public var color (default, set):UInt;

    public function new( _width :Float, _height:Float, _color:UInt, _alpha:Float){
        
        super();
        
        color      = _color;
        colorAlpha = _alpha;
        rectWidth  = _width;
        rectHeight = _height;
       
        draw();
    }

    private function draw():Void{
        this.graphics.clear();
        this.graphics.beginFill( color, colorAlpha);
        this.graphics.drawRect( 0, 0, rectWidth, rectHeight);
        this.graphics.endFill();
    }

    private function set_color(c:UInt){
        color = c;
        draw();
        return c;
    }
}