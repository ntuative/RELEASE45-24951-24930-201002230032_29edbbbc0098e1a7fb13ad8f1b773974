package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetClubGiftInfo;
   import com.sulake.habbo.communication.messages.outgoing.catalog.SelectClubGiftComposer;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ClubGiftController
   {
       
      
      private var _widget:ClubGiftWidget;
      
      private var var_996:int;
      
      private var var_1599:int;
      
      private var var_80:HabboCatalog;
      
      private var var_517:Array;
      
      private var _windowManager:IHabboWindowManager;
      
      public function ClubGiftController(param1:HabboCatalog)
      {
         super();
         var_80 = param1;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         if(!var_80)
         {
            return null;
         }
         return var_80.windowManager;
      }
      
      public function set widget(param1:ClubGiftWidget) : void
      {
         _widget = param1;
         var_80.connection.send(new GetClubGiftInfo());
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!var_80)
         {
            return null;
         }
         return var_80.getProductData(param1);
      }
      
      public function get giftsAvailable() : int
      {
         return var_996;
      }
      
      public function getOffers() : Array
      {
         return var_517;
      }
      
      public function setInfo(param1:int, param2:int, param3:Array) : void
      {
         var_1599 = param1;
         var_996 = param2;
         var_517 = [];
         if(param3)
         {
            var_517 = param3.slice();
         }
         _widget.update();
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_1599;
      }
      
      public function get assets() : IAssetLibrary
      {
         if(!var_80)
         {
            return null;
         }
         return var_80.assets;
      }
      
      public function get hasClub() : Boolean
      {
         if(!var_80 || !var_80.getPurse())
         {
            return false;
         }
         return var_80.getPurse().clubDays > 0;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         if(!var_80)
         {
            return null;
         }
         return var_80.localization;
      }
      
      public function selectGift(param1:String) : void
      {
         if(!param1 || !var_80 || true)
         {
            return;
         }
         var_80.connection.send(new SelectClubGiftComposer(param1));
         --var_996;
         _widget.update();
      }
      
      public function dispose() : void
      {
         var_80 = null;
         _windowManager = null;
      }
   }
}
