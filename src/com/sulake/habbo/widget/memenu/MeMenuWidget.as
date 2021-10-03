package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_707:String = "me_menu_settings_view";
      
      private static const const_761:int = 10;
      
      public static const const_555:String = "me_menu_effects_view";
      
      public static const const_86:String = "me_menu_top_view";
      
      public static const const_1218:String = "me_menu_rooms_view";
      
      public static const const_989:String = "me_menu_dance_moves_view";
      
      public static const const_214:String = "me_menu_my_clothes_view";
       
      
      private var var_2212:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1545:int = 0;
      
      private var var_2213:int = 0;
      
      private var var_2214:Boolean = false;
      
      private var var_266:Boolean = false;
      
      private var var_2211:int = 0;
      
      private var var_1618:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_585:Boolean = false;
      
      private var var_88:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1305:int = 0;
      
      private var var_2210:Boolean = false;
      
      private var var_1041:Point;
      
      private var var_25:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1041 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_2210 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_86);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_715,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_581,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_544,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_553,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_305,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_602,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_407,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_900,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_208,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_183,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_609,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_182,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_297,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_83,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_340,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_152,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_585;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_266)
         {
            return;
         }
         if(var_25.window.name == const_707)
         {
            (var_25 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1305 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1545 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1545.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_266 && var_25.window.name == const_214))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_489);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_715,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_581,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_544,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_553,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_305,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_208,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_183,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_609,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_602,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_407,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_900,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_182,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_297,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_340,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_83,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_152,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_25 != null)
         {
            var_25.dispose();
            var_25 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2212;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1618 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_88 != null)
         {
            var_88.dispose();
            var_88 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_2214;
      }
      
      public function get creditBalance() : int
      {
         return var_1545;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_340:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_266 + " view: " + var_25.window.name);
               if(var_266 != true || var_25.window.name != const_86)
               {
                  return;
               }
               (var_25 as MeMenuMainView).setIconAssets("clothes_icon",const_86,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_83:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1618 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2213;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_585 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_585 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1305 > 0;
         var_1305 = param1.daysLeft;
         var_2213 = param1.periodsLeft;
         var_2211 = param1.pastPeriods;
         var_2212 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_25 != null)
            {
               changeView(var_25.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2214 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_25 != null && var_25.window.name != const_214)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_25 != null && var_25.window.name == const_214)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_945)
            {
               var_88 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1112);
            }
            else
            {
               var_88 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_362);
            }
            _loc2_ = _mainContainer.getChildByName(var_25.window.name);
            if(_loc2_ != null)
            {
               var_88.window.x = _loc2_.width + const_761;
               _mainContainer.addChild(var_88.window);
               _mainContainer.width = var_88.window.x + var_88.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_585 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_585 = true;
            }
         }
         if(var_25 != null && var_25.window.name == const_555)
         {
            (var_25 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2211;
      }
      
      public function get habboClubDays() : int
      {
         return var_1305;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1132,HabboWindowStyle.const_963,HabboWindowParam.const_23,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_266 = !var_266;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_266 = false;
               break;
            default:
               return;
         }
         if(var_266)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_614);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_25 != null)
         {
            _mainContainer.removeChild(var_25.window);
            var_25.dispose();
            var_25 = null;
         }
         var_266 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_25 != null && var_25.window.name == const_214)
         {
            if(var_88 != null)
            {
               var_88.dispose();
               var_88 = null;
            }
            changeView(const_86);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2210;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_88 != null)
         {
            var_88.dispose();
            var_88 = null;
         }
         switch(param1)
         {
            case const_86:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_555:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_989:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_214:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1218:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_707:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_25 != null)
            {
               _mainContainer.removeChild(var_25.window);
               var_25.dispose();
               var_25 = null;
            }
            var_25 = _loc2_;
            var_25.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_25 != null)
         {
            var_1041.x = var_25.window.width + 10;
            var_1041.y = var_25.window.height;
            var_25.window.x = 5;
            var_25.window.y = 0;
            _mainContainer.width = var_1041.x;
            _mainContainer.height = var_1041.y;
            if(var_88 != null)
            {
               _mainContainer.width = var_88.window.x + var_88.window.width + const_761;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_86);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_607);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_266 = true;
      }
   }
}
