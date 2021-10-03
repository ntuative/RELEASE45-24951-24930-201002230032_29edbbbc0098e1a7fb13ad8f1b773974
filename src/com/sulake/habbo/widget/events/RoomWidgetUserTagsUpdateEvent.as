package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_122:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_589:Array;
      
      private var var_1937:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_122,param4,param5);
         _userId = param1;
         var_589 = param2;
         var_1937 = param3;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get tags() : Array
      {
         return var_589;
      }
      
      public function get isOwnUser() : Boolean
      {
         return var_1937;
      }
   }
}
