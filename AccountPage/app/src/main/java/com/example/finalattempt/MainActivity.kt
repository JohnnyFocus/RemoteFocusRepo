package com.example.finalattempt

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val actionBar = supportActionBar
        actionBar!!.title = "Home"


        val button1 = findViewById<Button>(R.id.happyPlaceBtn)
        button1.setOnClickListener {
            val intent = Intent(this, HappyPlace::class.java)
            startActivity(intent)
        }
        val button2 = findViewById<Button>(R.id.tutuButton)
        button2.setOnClickListener {
            val intent = Intent(this, Tutu::class.java)
            startActivity(intent)
        }
        val button3 = findViewById<Button>(R.id.shakeButton)
        button3.setOnClickListener {
            val intent = Intent(this, SnS::class.java)
            startActivity(intent)
        }
        val button4 = findViewById<Button>(R.id.bistroButton)
        button4.setOnClickListener {
            val intent = Intent(this, Wynee::class.java)
            startActivity(intent)
        }
        val button5 = findViewById<Button>(R.id.underCafButton)
        button5.setOnClickListener {
            val intent = Intent(this, UnderCaf::class.java)
            startActivity(intent)
        }
        val button6 = findViewById<Button>(R.id.buckButton)
        button6.setOnClickListener {
            val intent = Intent(this, BuckStop::class.java)
            startActivity(intent)
        }
    }
}