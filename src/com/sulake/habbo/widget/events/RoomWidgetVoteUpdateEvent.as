package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_89:String = "RWPUE_VOTE_RESULT";
      
      public static const const_102:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1309:int;
      
      private var var_921:String;
      
      private var var_661:Array;
      
      private var var_934:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_921 = param2;
         var_934 = param3;
         var_661 = param4;
         if(var_661 == null)
         {
            var_661 = [];
         }
         var_1309 = param5;
      }
      
      public function get votes() : Array
      {
         return var_661.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1309;
      }
      
      public function get question() : String
      {
         return var_921;
      }
      
      public function get choices() : Array
      {
         return var_934.slice();
      }
   }
}
