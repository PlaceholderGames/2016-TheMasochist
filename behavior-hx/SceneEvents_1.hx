package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_1 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(getActor(3).isMouseDown())
				{
					getActor(3).setAnimation("" + "Level 1 down");
				}
				else
				{
					getActor(3).setAnimation("" + "Level 1 up");
				}
				if(getActor(4).isMouseDown())
				{
					getActor(4).setAnimation("" + "Level 2 down");
				}
				else
				{
					getActor(4).setAnimation("" + "Level 2 up");
				}
				if(getActor(5).isMouseDown())
				{
					getActor(5).setAnimation("" + "Level 3 down");
				}
				else
				{
					getActor(5).setAnimation("" + "Level 3 up");
				}
				if(getActor(6).isMouseDown())
				{
					getActor(6).setAnimation("" + "Level 4 down");
				}
				else
				{
					getActor(6).setAnimation("" + "Level 4 up");
				}
				if(getActor(7).isMouseDown())
				{
					getActor(7).setAnimation("" + "Level 5 down");
				}
				else
				{
					getActor(7).setAnimation("" + "Level 5 up");
				}
				if(getActor(8).isMouseDown())
				{
					getActor(8).setAnimation("" + "Back down");
				}
				else
				{
					getActor(8).setAnimation("" + "Back up");
				}
			}
		});
		
		/* ============================ Click ============================= */
		addMouseReleasedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(getActor(3).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(4).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(4).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(5).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(4).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(4).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(3).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(8).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(0).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}