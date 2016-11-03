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



class SceneEvents_0 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		if(Engine.engine.getGameAttribute("Sound"))
		{
			getActor(3).setAnimation("" + "Sound on up");
		}
		else
		{
			getActor(3).setAnimation("" + "Sound off up");
		}
		
		/* ============================ Click ============================= */
		addMouseReleasedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(getActor(1).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(2).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(2).isMouseReleased())
				{
					switchScene(GameModel.get().scenes.get(1).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
				}
				if(getActor(3).isMouseReleased())
				{
					Engine.engine.setGameAttribute("Sound", !(Engine.engine.getGameAttribute("Sound")));
					if(Engine.engine.getGameAttribute("Sound"))
					{
						getActor(3).setAnimation("" + "Sound on up");
					}
					else
					{
						getActor(3).setAnimation("" + "Sound off up");
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(getActor(1).isMouseDown())
				{
					getActor(1).setAnimation("" + "Play down");
				}
				else
				{
					getActor(1).setAnimation("" + "Play up");
				}
				if(getActor(2).isMouseDown())
				{
					getActor(2).setAnimation("" + "Level select down");
				}
				else
				{
					getActor(2).setAnimation("" + "Level select up");
				}
				if(getActor(3).isMouseDown())
				{
					if(Engine.engine.getGameAttribute("Sound"))
					{
						getActor(3).setAnimation("" + "Sound on down");
					}
					else
					{
						getActor(3).setAnimation("" + "Sound off down");
					}
				}
				else
				{
					if(Engine.engine.getGameAttribute("Sound"))
					{
						getActor(3).setAnimation("" + "Sound on up");
					}
					else
					{
						getActor(3).setAnimation("" + "Sound off up");
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}