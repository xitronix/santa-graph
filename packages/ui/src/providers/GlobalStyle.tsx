import { createGlobalStyle } from 'styled-components'
import { Colors, Fonts } from '../constants'

export const GlobalStyle = createGlobalStyle`
  * {
    box-sizing: border-box;
  }

  body, html {
    margin: 0;
    width: 100%;
    height: 100%;
    background-color: ${Colors.LightGray};
    font-family: ${Fonts.Body};
    font-size: 16px;
  }

  button {
    font-family: ${Fonts.Body};
    font-size: 1rem;
  }
`
