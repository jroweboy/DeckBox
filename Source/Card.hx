package;


import nme.display.Bitmap;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.Assets;


/**
 * A generic card that stores the image data in the sprite along with its name and 
 * the cards that are both in front and behind this card. This is in accordance with
 * the deck being implemented as a doubly linked list. (But you didn't need to know that)
 * 
 * @author James Rowe
 */
class Card extends Sprite {
	private var image:Bitmap;
	private var name:String;
	private var head:Card;
	private var rear:Card;
	
	public function new () {
		super ();
		addEventListener (Event.ADDED_TO_STAGE, this_onAddedToStage);
	}
	
	private function construct (name:String, image_name:String) {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		
		image = new Bitmap (Assets.getBitmapData ("assets/"+image_name+".png"));
		
		resize ();
		addChild (image);
		
		stage.addEventListener (Event.RESIZE, stage_onResize);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, this_onDrag, false, 0, true);
        stage.addEventListener(MouseEvent.MOUSE_UP, this_onDrop, false, 0, true);
    }
	
	public function addAfter(card:Card):Void {
		this.head = card;
		this.rear = card.rear;
		card.rear = this;
	}

	public function addBefore(card:Card):Void {
		this.rear = card;
		this.head = card.head;
		card.head = this;
	}

	private function resize () {
		// TODO: recalulate the sizes?
		// logo.x = (stage.stageWidth - logo.width) / 2;
		// logo.y = (stage.stageHeight - logo.height) / 2;
	}
	
	// Event Handlers
	private function stage_onResize (event:Event):Void {
		resize ();
	}
	
	private function this_onAddedToStage (event:Event):Void {
		construct ();
	}

	private function this_onDrag (event:Event):Void {
	}

	private function this_onDrop (event:Event):Void {
	}
	
}
