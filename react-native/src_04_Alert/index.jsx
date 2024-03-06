import { Text, StyleSheet, View, SafeAreaView, Button, Alert, useColorScheme } from 'react-native'
import React, { Component } from 'react'
import AHRNLinearGradient from '../js/AHLinearGradientViewNativeComponent'

export default class index extends Component {
  render() {
    return (
      <SafeAreaView style={styles.container}>
        <Button 
          title='alert'
          onPress={() => {
            alert('我是一个按钮')
          }}></Button>
        <Text>Page content</Text>

        <AHRNLinearGradient start={[0.00, 0.25]}
                              end={[0.5, 1.0]}
                              colors={[0xFFFF0000, 0xFF00FF00, 0xFF0000FF]} /*0xargb*/
                              locations={[0.25, 0.50, 0.75]}
                              style={styles.linearGradient}>
        </AHRNLinearGradient>
        
      </SafeAreaView>
    )
  }
}

const styles = StyleSheet.create({
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
  },
  highlight: {
    fontWeight: '700',
  },
  linearGradient: {
    width: 360,
    height: 160,
    justifyContent: 'center',
    alignItems: 'center'
  },
  text: {
    color: 'black',
    fontWeight: 'bold',
    backgroundColor: 'transparent',
    opacity: 0.5
  },
  inputs: {
    width: 300,
    height: 45,
    borderWidth: 1,
    marginLeft: 15,
    marginRight: 15,
    marginBottom: 15,
    paddingLeft: 5,
    borderColor: '#CCC',
    borderRadius: 4,
  }
});

// const styles = StyleSheet.create({})