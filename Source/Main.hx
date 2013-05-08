package;

import nme.Lib;

/**
 * @author Joshua Granick
 */
class Main extends Widget{

	public static function main () {
        UIBuilder.regClass('Card');
        UIBuilder.init();
        Lib.current.addChild( UIBuilder.buildFn('main.xml')() );
	}
	
}
