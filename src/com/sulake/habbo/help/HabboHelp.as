package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1941:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_122:TutorialUI;
      
      private var var_1450:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_50:HelpUI;
      
      private var var_1449:IHabboConfigurationManager;
      
      private var var_176:IHabboToolbar;
      
      private var var_558:IHabboCommunicationManager;
      
      private var var_818:FaqIndex;
      
      private var var_1940:String = "";
      
      private var var_1416:IncomingMessages;
      
      private var var_1211:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1211 = new CallForHelpData();
         var_1941 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_818 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_176;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_50 != null)
         {
            var_50.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_50 == null)
         {
            if(!method_2())
            {
               return;
            }
         }
         var_50.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_122 != null)
         {
            var_122.dispose();
            var_122 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1940;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1211.reportedUserId = param1;
         var_1211.reportedUserName = param2;
         var_50.showUI(HabboHelpViewEnum.const_308);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_1450;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_75:
               if(var_50 != null)
               {
                  var_50.setRoomSessionStatus(true);
               }
               if(var_122 != null)
               {
                  var_122.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_85:
               if(var_50 != null)
               {
                  var_50.setRoomSessionStatus(false);
               }
               if(var_122 != null)
               {
                  var_122.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_50 != null)
         {
            var_50.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1941;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_50 != null)
         {
            var_50.showCallForHelpResult(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(var_50 != null)
         {
            var_50.dispose();
            var_50 = null;
         }
         if(var_122 != null)
         {
            var_122.dispose();
            var_122 = null;
         }
         var_1416 = null;
         if(var_818 != null)
         {
            var_818.dispose();
            var_818 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_176 != null)
         {
            var_176.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_92,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_122 == null && _assetLibrary != null && _windowManager != null)
         {
            var_122 = new TutorialUI(this);
         }
         return var_122 != null;
      }
      
      private function method_2() : Boolean
      {
         if(var_50 == null && _assetLibrary != null && _windowManager != null)
         {
            var_50 = new HelpUI(this,_assetLibrary,_windowManager,var_1450,var_176);
         }
         return var_50 != null;
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1940 = param1;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1211;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1450 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_122 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_122.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_558 = IHabboCommunicationManager(param2);
         var_1416 = new IncomingMessages(this,var_558);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_50 != null)
         {
            var_50.showUI(param1);
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_558 != null && param1 != null)
         {
            var_558.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_818;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_50 != null)
         {
            var_50.updateCallForGuideBotUI(false);
         }
      }
      
      public function hideUI() : void
      {
         if(var_50 != null)
         {
            var_50.hideUI();
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_176 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1449 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_122;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_63)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_46)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_75,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_85,onRoomSessionEvent);
         var_176.events.addEventListener(HabboToolbarEvent.const_63,onHabboToolbarEvent);
         var_176.events.addEventListener(HabboToolbarEvent.const_46,onHabboToolbarEvent);
         method_2();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_50 != null)
         {
            var_50.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_1449 == null)
         {
            return param1;
         }
         return var_1449.getKey(param1,param2,param3);
      }
   }
}
