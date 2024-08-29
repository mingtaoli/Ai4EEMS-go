这里是`Mediaprop`微服务的API结构设计，使用POST请求。

### 基础URL
```
https://www.ai4energy.com/mediaprop
```

### 1. **CoolProp API**
#### 1.1 **纯工质热物性**
- **接口路径:** `/coolprop/purefluid`
- **方法:** `POST`
- **描述:** 计算纯工质的特定热物性。
- **请求体:**
  ```json
  {
    "fluid_name": "water",
    "property": "density",
    "T": 300,
    "P": 101325
  }
  ```
  - `fluid_name` (字符串): 工质名称 (例如: "water", "methane")。
  - `property` (字符串): 需要计算的物性 (例如: "density", "enthalpy")。
  - `T` (可选, 浮点数): 温度 (单位: K)。
  - `P` (可选, 浮点数): 压力 (单位: Pa)。

- **响应:**
  ```json
  {
    "fluid_name": "water",
    "property": "density",
    "value": 997.0479,
    "units": "kg/m³",
    "inputs": {
      "T": 300,
      "P": 101325
    }
  }
  ```

#### 1.2 **混合工质热物性**
- **接口路径:** `/coolprop/mixture`
- **方法:** `POST`
- **描述:** 计算混合工质的特定热物性。
- **请求体:**
  ```json
  {
    "fluid_name1": "water",
    "fluid_name2": "methanol",
    "property": "enthalpy",
    "T": 300,
    "P": 101325,
    "x": 0.5
  }
  ```
  - `fluid_name1`, `fluid_name2` (字符串): 混合物中的工质名称 (例如: "water", "methanol")。
  - `property` (字符串): 需要计算的物性 (例如: "density", "enthalpy")。
  - `T` (可选, 浮点数): 温度 (单位: K)。
  - `P` (可选, 浮点数): 压力 (单位: Pa)。
  - `x` (可选, 浮点数): 第一种工质的摩尔分数。

- **响应:**
  ```json
  {
    "fluid_name1": "water",
    "fluid_name2": "methanol",
    "property": "enthalpy",
    "value": 1500.25,
    "units": "J/kg",
    "inputs": {
      "T": 300,
      "P": 101325,
      "x": 0.5
    }
  }
  ```

### 2. **其他工质热物性计算**
- **接口路径:** `/coolprop/{calculation_type}`
- **方法:** `POST`
- **描述:** 计算其他类型工质的特定热物性（如制冷剂、盐水等）。
- **请求体:**
  ```json
  {
    "calculation_type": "refrigerant",
    "fluid_name": "R134a",
    "property": "enthalpy",
    "T": 250,
    "P": 500000
  }
  ```
  - `calculation_type` (字符串): 计算类型 (例如: "refrigerant", "brine")。
  - `fluid_name` (字符串): 工质名称。
  - `property` (字符串): 需要计算的物性。
  - `T` (可选, 浮点数): 温度 (单位: K)。
  - `P` (可选, 浮点数): 压力 (单位: Pa)。

- **响应:**
  ```json
  {
    "fluid_name": "R134a",
    "property": "enthalpy",
    "value": 400.75,
    "units": "J/kg",
    "inputs": {
      "T": 250,
      "P": 500000
    }
  }
  ```

### 3. **错误处理**
- **响应:**
  ```json
  {
    "error": "无效的工质名称或物性",
    "message": "工质名称 'unknownfluid' 未被识别。"
  }
  ```