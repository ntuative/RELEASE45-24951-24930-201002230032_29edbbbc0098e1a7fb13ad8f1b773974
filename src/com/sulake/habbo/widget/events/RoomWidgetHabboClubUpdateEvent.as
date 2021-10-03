package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_183:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1693:Boolean = false;
      
      private var var_1696:int = 0;
      
      private var var_1694:int = 0;
      
      private var var_1695:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_183,param5,param6);
         var_1695 = param1;
         var_1694 = param2;
         var_1696 = param3;
         var_1693 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1696;
      }
      
      public function get periodsLeft() : int
      {
         return var_1694;
      }
      
      public function get daysLeft() : int
      {
         return var_1695;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1693;
      }
   }
}
