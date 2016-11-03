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



class Design_33_33_Jump extends ActorScript
{
	public var _JumpLeftanimation:String;
	public var _JumpRightanimation:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Jump Left animation", "_JumpLeftanimation");
		nameMap.set("Jump Right animation", "_JumpRightanimation");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		actor.setActorValue("On Ground?", false);
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((isKeyPressed("action1") && (actor.getActorValue("On Ground?") == true)))
				{
					actor.applyImpulse(0, -1, 40);
				}
				runLater(1000 * 0.075, function(timeTask:TimedTask):Void
				{
					if(actor.isAlive())
					{
						actor.setActorValue("On Ground?", false);
					}
				}, actor);
				if((actor.getActorValue("On Ground?") == false))
				{
					if((actor.getActorValue("Facing Right?") == true))
					{
						actor.setAnimation("" + _JumpLeftanimation);
						actor.setCurrentFrame(Std.int(0));
					}
					else
					{
						actor.setAnimation("" + _JumpRightanimation);
						actor.setCurrentFrame(Std.int(0));
					}
				}
			}
		});
		
		/* ======================== Something Else ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(event.thisCollidedWithTile)
				{
					for(point in event.points)
					{
						if((Math.abs(Math.round(Engine.toPixelUnits(point.normalY))) > 0.1))
						{
							actor.setActorValue("On Ground?", true);
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}