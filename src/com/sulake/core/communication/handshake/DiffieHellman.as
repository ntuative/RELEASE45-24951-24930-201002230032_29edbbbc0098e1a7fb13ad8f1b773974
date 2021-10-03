package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1392:BigInteger;
      
      private var var_930:BigInteger;
      
      private var var_1784:BigInteger;
      
      private var var_1391:BigInteger;
      
      private var var_1785:BigInteger;
      
      private var var_1786:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1392 = param1;
         var_1784 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1785.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1391 = new BigInteger();
         var_1391.fromRadix(param1,param2);
         var_1785 = var_1391.modPow(var_930,var_1392);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1786.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_930 = new BigInteger();
         var_930.fromRadix(param1,param2);
         var_1786 = var_1784.modPow(var_930,var_1392);
         return true;
      }
   }
}
