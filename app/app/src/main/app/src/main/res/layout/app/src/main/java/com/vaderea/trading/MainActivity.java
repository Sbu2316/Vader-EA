<?xml version="1.0" encoding="utf-8"?>

<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#080808">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:padding="20dp">

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="VADER EA"
            android:textColor="#FFFFFF"
            android:textSize="32sp"
            android:textStyle="bold"
            android:gravity="center"
            android:padding="10dp" />

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="CRT TRADING SYSTEM"
            android:textColor="#AAAAAA"
            android:textSize="15sp"
            android:gravity="center"
            android:paddingBottom="20dp" />

        <TextView
            android:id="@+id/statusText"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="BOT: OFFLINE"
            android:textColor="#FFFFFF"
            android:textSize="21sp"
            android:textStyle="bold"
            android:gravity="center"
            android:padding="18dp" />

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="MARKETS"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold"
            android:paddingTop="15dp"
            android:paddingBottom="10dp" />

        <TextView
            android:id="@+id/xauusdStatus"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="XAUUSD    WAITING"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="12dp" />

        <TextView
            android:id="@+id/nas100Status"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="NAS100    WAITING"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="12dp" />

        <TextView
            android:id="@+id/us30Status"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="US30      WAITING"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="12dp" />

        <TextView
            android:id="@+id/btcusdStatus"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="BTCUSD    WAITING"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="12dp" />

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="CRT RANGE"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold"
            android:paddingTop="20dp" />

        <TextView
            android:id="@+id/crtHigh"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="CRT HIGH: --"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="10dp" />

        <TextView
            android:id="@+id/crtLow"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="CRT LOW: --"
            android:textColor="#FFFFFF"
            android:textSize="17sp"
            android:padding="10dp" />

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="LOT SIZE"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold"
            android:paddingTop="20dp" />

        <EditText
            android:id="@+id/lotSize"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:inputType="numberDecimal"
            android:text="0.01"
            android:textColor="#FFFFFF" />

        <Button
            android:id="@+id/startButton"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="START VADER EA"
            android:layout_marginTop="25dp" />

        <Button
            android:id="@+id/stopButton"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="STOP VADER EA"
            android:layout_marginTop="10dp" />

    </LinearLayout>

</ScrollView>
