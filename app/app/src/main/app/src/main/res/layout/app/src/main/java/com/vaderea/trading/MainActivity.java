package com.vaderea.trading;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {

    private TextView statusText;
    private TextView crtHigh;
    private TextView crtLow;

    private Button startButton;
    private Button stopButton;

    private EditText lotSize;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        statusText = findViewById(R.id.statusText);
        crtHigh = findViewById(R.id.crtHigh);
        crtLow = findViewById(R.id.crtLow);

        startButton = findViewById(R.id.startButton);
        stopButton = findViewById(R.id.stopButton);

        lotSize = findViewById(R.id.lotSize);

        startButton.setOnClickListener(v -> {

            String lots = lotSize.getText().toString();

            if (lots.isEmpty()) {
                lots = "0.01";
            }

            statusText.setText("BOT: RUNNING");

            // Demo display values for now.
            crtHigh.setText("CRT HIGH: WAITING");
            crtLow.setText("CRT LOW: WAITING");
        });

        stopButton.setOnClickListener(v -> {

            statusText.setText("BOT: STOPPED");

            crtHigh.setText("CRT HIGH: --");
            crtLow.setText("CRT LOW: --");
        });
    }
                }
