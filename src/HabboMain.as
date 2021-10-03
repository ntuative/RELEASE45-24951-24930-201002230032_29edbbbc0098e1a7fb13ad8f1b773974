package
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.ICore;
   import com.sulake.habbo.tracking.HabboLoginTrackingStep;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class HabboMain extends Sprite
   {
      
      private static const const_2:Number = 0.29;
      
      private static const const_8:Number = 0.71;
       
      
      private var var_1067:Boolean = false;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_35:ICore;
      
      public function HabboMain(param1:DisplayObjectContainer)
      {
         super();
         var_1 = param1;
         var_1.addEventListener(Event.COMPLETE,onCompleteEvent);
         var_1.addEventListener(ProgressEvent.PROGRESS,onProgressEvent);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         Logger.log("Core version: undefined");
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc7_:Sprite = param1.getChildByName("loadingBar") as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName("barSprite") as Sprite;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         var _loc9_:int = 16;
         var _loc10_:int = 196 * param2;
         _loc8_.graphics.beginFill(12241619);
         _loc8_.graphics.drawRect(0,0,_loc10_,_loc9_ / 2);
         _loc8_.graphics.endFill();
         _loc8_.graphics.beginFill(9216429);
         _loc8_.graphics.drawRect(0,_loc9_ / 2,_loc10_,_loc9_ / 2 + 1);
         _loc8_.graphics.endFill();
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         var_1067 = true;
      }
      
      public function method_12(param1:Event) : void
      {
         trackLoginStep(HabboLoginTrackingStep.const_1335);
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(var_1)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            _loc3_ = 1 - const_8 + _loc2_ * const_8;
            updateLoadingBar(var_1,_loc3_);
            _loc4_ = var_1.getChildByName("background") as Sprite;
            if(_loc4_)
            {
               _loc4_.alpha = Math.min(1 - _loc3_,_loc4_.alpha);
            }
         }
      }
      
      public function initializeCore() : void
      {
         try
         {
            var_35.initialize();
         }
         catch(error:Error)
         {
            Core.crash("Failed to initialize the core: " + error.message,CoreComponent.const_1177,error);
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         trackLoginStep(HabboLoginTrackingStep.const_1255);
         var_35 = Core.instantiate(stage,0);
         var_35.prepareComponent(CoreCommunicationFrameworkLib);
         var_35.prepareComponent(HabboRoomObjectLogicLib);
         var_35.prepareComponent(HabboRoomObjectVisualizationLib);
         var_35.prepareComponent(RoomManagerLib);
         var_35.prepareComponent(RoomSpriteRendererLib);
         var_35.prepareComponent(HabboRoomSessionManagerLib);
         var_35.prepareComponent(HabboAvatarRenderLib);
         var_35.prepareComponent(HabboRoomWidgetLib);
         var_35.prepareComponent(HabboSessionDataManagerLib);
         var_35.prepareComponent(HabboTrackingLib);
         var_35.prepareComponent(HabboConfigurationCom);
         var_35.prepareComponent(HabboLocalizationCom);
         var_35.prepareComponent(HabboWindowManagerCom);
         var_35.prepareComponent(HabboCommunicationCom);
         var_35.prepareComponent(HabboCommunicationDemoCom);
         var_35.prepareComponent(HabboNavigatorCom);
         var_35.prepareComponent(HabboFriendListCom);
         var_35.prepareComponent(HabboMessengerCom);
         var_35.prepareComponent(HabboInventoryCom);
         var_35.prepareComponent(HabboToolbarCom);
         var_35.prepareComponent(HabboCatalogCom);
         var_35.prepareComponent(HabboRoomEngineCom);
         var_35.prepareComponent(HabboRoomUICom);
         var_35.prepareComponent(HabboAvatarEditorCom);
         var_35.prepareComponent(HabboNotificationsCom);
         var_35.prepareComponent(HabboHelpCom);
         var_35.prepareComponent(HabboAdManagerCom);
         var_35.prepareComponent(HabboModerationCom);
         Logger.log("Sound manager embed...");
         Logger.log("Trying to embed Flash 9 version");
         var_35.prepareComponent(HabboSoundManagerCom);
         var_35.events.addEventListener(Component.COMPONENT_EVENT_ERROR,method_12);
         var_35.loadExternalConfigDocument(new URLRequest("config_habbo.xml"),var_1);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         if(var_1)
         {
            _loc2_ = var_1.getChildByName("background") as Sprite;
            if(_loc2_)
            {
               _loc2_.alpha -= 0.01;
               if(_loc2_.alpha <= 0)
               {
               }
            }
            if(var_1067)
            {
               if(true)
               {
                  initializeCore();
                  dispose();
                  var_1067 = false;
               }
               else
               {
                  var_1.alpha = -0.1;
               }
            }
         }
      }
      
      private function trackLoginStep(param1:String) : void
      {
         if(loaderInfo)
         {
            if(loaderInfo.parameters["processlog.enabled"] == "1")
            {
               Logger.log("* HabboMain Login Step: " + param1);
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
               }
               else
               {
                  Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
               }
            }
         }
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         if(var_1)
         {
            var_1.removeEventListener(Event.COMPLETE,onCompleteEvent);
            var_1.removeEventListener(ProgressEvent.PROGRESS,onProgressEvent);
            var_1 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
