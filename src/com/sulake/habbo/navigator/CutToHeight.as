package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_155:String;
      
      private var var_390:int;
      
      private var var_180:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_155 = param1;
         var_180 = param2;
         var_390 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_180.text = var_155.substring(0,param1) + "...";
         return var_180.textHeight > var_390;
      }
   }
}
