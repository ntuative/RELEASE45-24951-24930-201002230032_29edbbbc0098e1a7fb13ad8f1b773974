package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1093:int;
      
      private var var_1094:String;
      
      private var var_1825:String;
      
      private var _index:int;
      
      private var var_1826:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1093 = param1;
         var_1825 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1094;
      }
      
      public function get questionId() : int
      {
         return var_1093;
      }
      
      public function get questionText() : String
      {
         return var_1825;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1094 = param1;
         var_1826 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1826;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
