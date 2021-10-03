package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_574:int = 6;
      
      public static const const_202:int = 5;
      
      public static const const_613:int = 2;
      
      public static const const_304:int = 9;
      
      public static const const_307:int = 4;
      
      public static const const_215:int = 2;
      
      public static const const_683:int = 4;
      
      public static const const_188:int = 8;
      
      public static const const_518:int = 7;
      
      public static const const_227:int = 3;
      
      public static const const_316:int = 1;
      
      public static const const_207:int = 5;
      
      public static const const_455:int = 12;
      
      public static const const_263:int = 1;
      
      public static const const_645:int = 11;
      
      public static const const_708:int = 3;
      
      public static const const_1454:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_395:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_395 = new Array();
         var_395.push(new Tab(_navigator,const_316,const_455,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_332));
         var_395.push(new Tab(_navigator,const_215,const_263,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_332));
         var_395.push(new Tab(_navigator,const_307,const_645,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_797));
         var_395.push(new Tab(_navigator,const_227,const_202,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_332));
         var_395.push(new Tab(_navigator,const_207,const_188,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_711));
         setSelectedTab(const_316);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_395)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_395)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_395)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_307;
      }
      
      public function get tabs() : Array
      {
         return var_395;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
