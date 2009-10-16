stop();
//****XML LOAD
var xmlQuestions:XML = new XML(); 
var questionLoader:URLLoader = new URLLoader();

//initiate the loading process
questionLoader.load(new URLRequest("Questions.xml")); 

//listener for completion of download
questionLoader.addEventListener(Event.COMPLETE, LoadComplete); 

//what should happen after download is complete
function LoadComplete(e:Event):void { 
     xmlQuestions = new XML(e.target.data); 
     useData(xmlQuestions);
	 play();
}

function useData(ourData:XML):void {
	//trace(ourData);
	trace(xmlQuestions.multiChoice[0].question);
}
this
//FRAME 2

stop();

// set event listeners
stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
stage.addEventListener(KeyboardEvent.KEY_UP, keyPressedUp);
stage.addEventListener(Event.ENTER_FRAME, checkMove);
stage.addEventListener(KeyboardEvent.KEY_DOWN, pickUpDrop);

// event handlers
function keyPressedDown(event:KeyboardEvent) {
	if (event.keyCode==37) {
		leftArrow=true;

	} else if (event.keyCode == 39) {
		rightArrow=true;

	} else if (event.keyCode == 38) {
		upArrow=true;

	} else if (event.keyCode == 40) {
		downArrow=true;
	}
}
function keyPressedUp(event:KeyboardEvent) {
	if (event.keyCode==37) {
		leftArrow=false;
		avatar_mc.gotoAndPlay("stand");
	} else if (event.keyCode == 39) {
		rightArrow=false;
		avatar_mc.gotoAndPlay("stand");
	} else if (event.keyCode == 38) {
		upArrow=false;
		avatar_mc.gotoAndPlay("stand");
	} else if (event.keyCode == 40) {
		downArrow=false;
		avatar_mc.gotoAndPlay("stand");
	}
}

// global variables
var _speed:Number=5;
var _avatar:Avatar;
var _game:Game;

var heldItem:worldObject;
var holding:Boolean = false;

//makes pop up menu and adds to screen as first quest

var questMenu:missionPopup = new missionPopup();
questMenu.x=stage.stageWidth/2;
questMenu.y=40;
questMenu.filters = [new DropShadowFilter(), new BevelFilter()];
questMenu.visible=false;
addChild(questMenu);

//tracks question number (1-3)
var level:Number=1;
var questionNumber:Number = 0+((level-1)*3);
trace(questionNumber);
//tracks question types (id, ga, lms)
var questionPath:String="";

setupGame();
_game.MoveAvatar(_avatar, _playerMv);



// utility methods
function setupGame() {
	_avatar = new Avatar(avatar_mc);
	_game = new Game(this);
	
	if (this.parent.parent!=null) {
		var loaderParent:Object = this.parent.parent as Object; 
		avatarType = loaderParent.avatarSelection;
		//imports previous scores
		idScore = loaderParent.idScore;
		gdScore = loaderParent.gdScore;
		lmsScore = loaderParent.lmsScore;
		idScore_txt.text = idScore.toString();
		gdScore_txt.text = gdScore.toString();
		lmsScore_txt.text = lmsScore.toString();
	}
		
	avatar.SetSex(avatarType);
}

function popUp() {
	questMenu.visible=true;
	questMenu.gotoAndStop(1);
	questMenu.questionNum_txt.text=xmlQuestions.multiChoice[questionNumber].questionNum;
	questMenu.question_txt.text=xmlQuestions.multiChoice[questionNumber].question;
	questMenu.id_btn.text_txt.text=xmlQuestions.multiChoice[questionNumber].ID;
	questMenu.gd_btn.text_txt.text=xmlQuestions.multiChoice[questionNumber].gd;
	questMenu.lms_btn.text_txt.text=xmlQuestions.multiChoice[questionNumber].lms;
	questionNumber+=1;
}


function addRemoveItem(){
	if(questionNumber - ((level-1)*3) == 1){
		if(questionPath == "ID"){
			var laptopItem:worldObject = new worldObject(300,300,'item','laptop');
			addChildAt(laptopItem,2);
			worldObjects.push(laptopItem);	 
			heldItem = laptopItem;
		}
		if(questionPath == "gd"){
			var cameraItem:worldObject = new worldObject(400,400,'item','camera');
			addChildAt(cameraItem,2);
			worldObjects.push(cameraItem);	
			heldItem = cameraItem;
		}
		if(questionPath == "lms"){
			var passwordlistItem:worldObject = new worldObject(500,500,'item','passwordlist');
			addChildAt(passwordlistItem,2);
			worldObjects.push(passwordlistItem);	
			heldItem = passwordlistItem;
		}
		holding = true;
		firstPerson.filters = [];
	} else if ((questionNumber - ((level-1)*3) == 2)) {
		var secondPerson:worldObject = new worldObject(350,350,'person','person');
		secondPerson.filters = [new GlowFilter(0xFF0000,1,15,15)];
		addChildAt(secondPerson,2);
		worldObjects.push(secondPerson);
	} else {
		removeChild(heldItem);
	}
	
	questMenu.feedback_txt.visible = true;
	trace(questionPath);
}


function pickUpDrop(evt:KeyboardEvent) {
	if (evt.keyCode==32) {
		for(var i:int = 0; i<worldObjects.length; i++) {
			var itemX:Rectangle=worldObjects[i].getBounds(this);
			var itemXBmpData=new BitmapData(itemX.width,itemX.height,true,0);
			itemXBmpData.draw(worldObjects[i]);
	
			if (itemXBmpData.hitTest(new Point(worldObjects[i].x, worldObjects[i].y),
			255,
			avatarBmpData,
			new Point(avatar_mc.x, avatar_mc.y),
			255)) {
				activate(worldObjects[i]);
				break;
			}
		}
	}
}

function activate(object:worldObject):void {	
	trace(MovieClip(object).itemType);
	switch (MovieClip(object).itemType) {
		case "item":
			addChild(MovieClip(object));
			MovieClip(object).x = 250;
			MovieClip(object).y = 15;
			worldObjects.splice(0,1);
			popUp();
			break;
		case "person":
			popUp();
			worldObjects.splice(0,1);
			break;
	}
}

