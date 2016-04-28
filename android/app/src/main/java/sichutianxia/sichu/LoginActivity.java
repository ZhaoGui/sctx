package sichutianxia.sichu;

import android.app.Activity;
import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TabHost;

import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
import com.baidu.location.LocationClient;
import com.baidu.location.LocationClientOption;
import com.baidu.location.Poi;
import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.MapView;

import java.util.List;

/**
 * Created by pp on 16-4-13.
 */
public class LoginActivity extends TabActivity{


    Button mloginbutton;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home_activity);
        final TabHost tabHost = this.getTabHost();


        TabHost.TabSpec tab1 = tabHost.newTabSpec("tab1").setIndicator("首页")
                .setContent(R.id.tab1);

        tabHost.addTab(tab1);

        TabHost.TabSpec tab2 = tabHost.newTabSpec("tab2").setIndicator("订单")
                .setContent(R.id.tab2);

        tabHost.addTab(tab2);

        TabHost.TabSpec tab3 = tabHost.newTabSpec("tab3").setIndicator("我的")
                .setContent(R.id.tab3);

        tabHost.addTab(tab3);
        mloginbutton = (Button)findViewById(R.id.loginbutton);

        mloginbutton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){
            }
        });

    }

}
