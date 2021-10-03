package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1794:Boolean;
      
      private var var_1793:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1794 = Boolean(parseInt(param1.@club));
         var_1793 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1794;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1793;
      }
   }
}
