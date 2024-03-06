import type {ViewProps} from "react-native";
import type {HostComponent} from "react-native";
import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";
import { Double, Float } from "react-native/Libraries/Types/CodegenTypes";
import { Int32} from "react-native/Libraries/Types/CodegenTypes";

const convertPoint = (name: string, point: Array<number>) => {
  if (Array.isArray(point)) {
    console.warn(
      `LinearGradient '${name}' property shoule be an object with fields 'x' and 'y', ` +
      'Array type is deprecated.'
    );

    return {
      x: point[0],
      y: point[1]
    };
  }
  return point;
};

export interface NativeProps extends ViewProps {
  start?: Array<Double>;
  end?: Array<Double>;
  colors: Array<Int32>;
  locations?: Array<Double>;
  alpha?: Float;
}

export  default codegenNativeComponent<NativeProps>(
  'AHRNLinearGradient',
) as HostComponent<NativeProps>
