package ibd.specialized.com.sales;

import java.security.*;
import java.math.*;

public class newencryptURI {
    public static void main(String args[]) throws Exception{
        String s="48b8b97fa6a9172e866ad4d7dee8162dservice2017-01-10T19:26:22.788-08:00Id,SourceCode,OrderStatus,OrderShopId,OrderDate,OrderAmount,OrderShopName,ShipperId,LogisticsNumber,ShortAddress,ReceivedAmount,ShipAmount,ReceivName,ReceivAddress,ReceivAreaName,ReceivCityName,ReceivProvinceName,ReceivZip,ReceivPhone,ReceivMobile,ProductAmount,CodAmount,PayType,PlatForm,ModifiedDate,ModifierId,IsInterecept,BuyerMessage,SellerMemo,InSideRemark,InvoiceHeader,InvoiceContent,PreSaleStatus,AuditTime,ExtendTextBurgeon.Wing.OnlineOrders.increment.get11002017-01-10T19:26:22.781-08:002017-01-10T19:26:22.790-08:001";
        MessageDigest m=MessageDigest.getInstance("MD5");
        m.update(s.getBytes(),0,s.length());
        System.out.println("MD5: "+new BigInteger(1,m.digest()).toString(16));
    }
}