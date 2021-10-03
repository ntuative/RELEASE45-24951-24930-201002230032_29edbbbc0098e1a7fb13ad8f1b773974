package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class RecyclerLogic implements IRecycler
   {
      
      private static const const_746:int = 0;
      
      public static const const_151:int = 5;
      
      private static const const_327:int = 1;
      
      private static const const_747:int = 2;
       
      
      private var _view:IRecyclerVisualization;
      
      private var var_627:Array;
      
      private var var_80:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1474:int;
      
      private var var_91:Array;
      
      private var var_255:int = 0;
      
      public function RecyclerLogic(param1:IHabboCatalog, param2:IHabboWindowManager)
      {
         var_91 = new Array();
         super();
         var_80 = param1;
         _windowManager = param2;
      }
      
      public function get active() : Boolean
      {
         return statusActive && systemActive;
      }
      
      private function updateRecyclerButton() : void
      {
         if(_view == null || !statusActive)
         {
            return;
         }
         _view.updateRecycleButton(isReadyToRecycle());
      }
      
      public function setSystemStatus(param1:int, param2:int) : void
      {
         var_1474 = param1;
         if(!systemActive)
         {
            return;
         }
         switch(var_1474)
         {
            case RecyclerStatusMessageEvent.const_1155:
               var_255 = const_327;
               if(_view == null)
               {
                  return;
               }
               _view.displayNormalView();
               var_80.setupInventoryForRecycler(true);
               verifyRoomSessionStatus();
               updateRecyclerSlots();
               updateRecyclerButton();
               break;
            case RecyclerStatusMessageEvent.const_841:
               if(_view == null)
               {
                  return;
               }
               _view.displayDisabledView();
               var_80.setupInventoryForRecycler(false);
               break;
            case RecyclerStatusMessageEvent.const_1110:
               if(_view == null)
               {
                  return;
               }
               _view.displayTimeOutView(param2);
               var_80.setupInventoryForRecycler(false);
               break;
         }
      }
      
      public function setRoomSessionActive(param1:Boolean) : void
      {
         if(param1 == false)
         {
            empty();
            verifyRoomSessionStatus();
         }
         updateRecyclerButton();
      }
      
      public function empty() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_151)
         {
            releaseSlot(_loc1_);
            _loc1_++;
         }
         updateRecyclerSlots();
         updateRecyclerButton();
      }
      
      public function init(param1:IRecyclerVisualization = null) : void
      {
         var_255 = const_747;
         var_91 = new Array(const_151);
         if(param1 == null)
         {
            return;
         }
         _view = param1;
         var_80.getRecyclerStatus();
      }
      
      public function executeRecycler() : void
      {
         var _loc3_:* = null;
         if(!isReadyToRecycle())
         {
            return;
         }
         var_255 = const_747;
         updateRecyclerButton();
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < var_91.length)
         {
            _loc3_ = var_91[_loc2_];
            if(_loc3_ == null)
            {
               return;
            }
            _loc1_.push(_loc3_.id);
            _loc2_++;
         }
         var_80.sendRecycleItems(_loc1_);
         _view.displayProcessingView();
      }
      
      private function get systemActive() : Boolean
      {
         return var_1474 != RecyclerStatusMessageEvent.const_841;
      }
      
      private function get statusActive() : Boolean
      {
         return var_255 != const_746;
      }
      
      public function getPrizeTable() : Array
      {
         if(var_627 == null)
         {
            var_80.getRecyclerPrizes();
            return null;
         }
         return var_627;
      }
      
      private function isPoolFull() : Boolean
      {
         if(var_91 == null)
         {
            return false;
         }
         if(var_91.length < const_151)
         {
            return false;
         }
         var _loc1_:int = 0;
         while(_loc1_ < var_91.length)
         {
            if(true)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function storePrizeTable(param1:Array) : void
      {
         var _loc3_:* = null;
         var_627 = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new PrizeLevelContainer(param1[_loc2_],var_80);
            var_627.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         var_91 = null;
         var_80 = null;
      }
      
      private function get ready() : Boolean
      {
         return active && var_255 == const_327;
      }
      
      public function getSlotContent(param1:int) : FurniSlotItem
      {
         if(var_91 == null)
         {
            return null;
         }
         if(param1 >= var_91.length)
         {
            return null;
         }
         return var_91[param1];
      }
      
      public function placeObjectAtSlot(param1:int, param2:int, param3:int, param4:int, param5:String) : void
      {
         var oldObjectData:FurniSlotItem = null;
         var newSlotId:int = 0;
         var slotId:int = param1;
         var id:int = param2;
         var category:int = param3;
         var typeId:int = param4;
         var xxxExtra:String = param5;
         if(!ready)
         {
            return;
         }
         if(false)
         {
            oldObjectData = var_91[0];
            newSlotId = 0;
            while(oldObjectData != null && newSlotId < const_151)
            {
               oldObjectData = var_91[newSlotId];
               if(oldObjectData != null)
               {
                  newSlotId++;
               }
            }
            if(oldObjectData != null)
            {
               return;
            }
            slotId = newSlotId;
         }
         var itemId:int = var_80.requestInventoryFurniToRecycler();
         if(itemId == 0)
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.non.recyclable}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         var_91[slotId] = new FurniSlotItem(itemId,category,typeId,xxxExtra);
         updateRecyclerSlots();
         updateRecyclerButton();
      }
      
      private function isTradingActive() : Boolean
      {
         return var_80.tradingActive;
      }
      
      private function updateRecyclerSlots() : void
      {
         if(_view == null || !statusActive)
         {
            return;
         }
         _view.updateSlots();
      }
      
      public function activate() : void
      {
         if(systemActive)
         {
            var_255 = const_327;
         }
      }
      
      private function verifyRoomSessionStatus() : void
      {
         if(ready)
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.privateroom}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
         }
      }
      
      public function cancel() : void
      {
         var_80.setupInventoryForRecycler(false);
         var _loc1_:int = 0;
         while(_loc1_ < const_151)
         {
            releaseSlot(_loc1_);
            _loc1_++;
         }
         var_255 = const_746;
      }
      
      public function setFinished(param1:int, param2:int) : void
      {
         var status:int = param1;
         var prizeId:int = param2;
         if(!statusActive)
         {
            return;
         }
         var_255 = const_327;
         if(!systemActive)
         {
            return;
         }
         switch(status)
         {
            case RecyclerFinishedMessageEvent.const_888:
               if(_view != null)
               {
                  _view.displayFinishedView();
               }
               break;
            case RecyclerFinishedMessageEvent.const_1329:
               Logger.log("* Recycler finished with FAILURE");
               _windowManager.alert("${generic.alert.title}","${recycler.info.closed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               if(_view != null)
               {
                  _view.displayDisabledView();
               }
         }
         var_80.setupInventoryForRecycler(false);
      }
      
      public function releaseSlot(param1:int) : void
      {
         if(!ready)
         {
            return;
         }
         if(true)
         {
            return;
         }
         if(!var_80.returnInventoryFurniFromRecycler(var_91[param1].id))
         {
            return;
         }
         var_91[param1] = null;
         updateRecyclerSlots();
         updateRecyclerButton();
      }
      
      public function isReadyToRecycle() : Boolean
      {
         if(!ready || true)
         {
            return false;
         }
         if(isTradingActive())
         {
            _windowManager.alert("${generic.alert.title}","${recycler.alert.trading}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return false;
         }
         return isPoolFull();
      }
   }
}
