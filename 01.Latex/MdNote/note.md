---
output:
  word_document
---
# 1. Todo

* [ ] 1. 使用gif进行演示
* [ ] 2. 为什么Patten很大的时候，要加载很久？加载久的原因是因为需要patten存储在Chroma上吗？
* [ ] 3. 代码究竟是在PC端执行的还是在Chroma 里面执行的。如果在PC端执行，为什么Patten还要加载这么久？
* [ ] 4. 如何设计一个更好的Log系统
* [ ] 5. AC 和 DC 的区别
* [ ] 6. `Channel Debug` 是配置工具还是测试工具?
* [ ] 7. WD 中的INL,DNL 是ADC 测试的INL,DNL 有什么区别？
* [ ] 8. TMU 是测试板卡资源的信号还是端口的信号？
* [X] 9. 这几种PowerPin的区别？

  > 其实就是不同选配的DPS(**Device Power Supply**)
  
  | type  | description                |                           |
  |-------|----------------------------|---------------------------|
  | MLDPS | Pin is a DUT Power Supply. | Device power supply       |
  | DPS   | Pin is a DUT Power Supply. | Device power supply       |
  | UVI   | Pin is a DUT Power pin.    | Universal Voltage Current |
  | PREF  | Pin is a DUT Power pin.    | MXREF板卡才会使用         |


* [ ] 10. 这几种PowerPin的区别
* [ ] 11. TIME_NAME_DEF
* [ ] 12. HW_BIN_DEF和SW_BIN_DEF有什么区别？

  > HW 问题和软件问题
  >
* [X] 13. 如何使用命令行进行make

  > 直接make,但是要传入craft的安装目录`CRAFT_HOME=C:\\CRAFT`
  >
* [ ] 14. 测试小电流有没有最佳配置
* [ ] 15. 测试电流前要等多久
* [ ] 16. condition 的这几个变量是干嘛的。 IF_ROM1.GetPART(), IF_ROM1.GetJOB(), IF_ROM1.GetENV()。另外获取到的是字符串吗？
* [X] 17. 为什么测试电压要`FORCE_I_XXX`,测试电流要`FORCE_v_XXX`?

  > 通常測試系統，會提供電壓來量電流，或者提供電流來量電壓。測試系統通常不會直接量測電阻值，而是經由量測電壓或電流，再利用歐姆定律計算出電阻值。
  >
* [X] 18. 通过`FORCE_I_XXX` 测试电压的时候，需要设置多大的`I`?

  > 如果只是想量电压，那就force`0uA`。
  >
* [ ] 19. `JUDGE_I_MLDPS`,`MEAS_I_MLDPS` 有什么区别？

  > judge是直接判断,
  >
* [X] 20. force 电压和电流是否可以设置为负值?

  > 可以设置为负值。
  >
* [X] 21. `SET_CBIT`、`RELAY_ON`、`RELAY_OFF` 有什么区别？

  > `SET_CBIT` 是板子上面的.是用户自己做的relay。需要连接UR的那个slot.
  > `RELAY_ON/OFF` 是控制我们测试机内部的.
  >
* [X] 22. 如何一次性关闭所有资源的relay`RELAY_OFF`?

  > 在IO 资源连接不清晰的情况下。建议使用: `RELAY_OFF(PIN的名字,ALL,)`断开所有的资源在进行连接。

* [ ] 23. `JUDGE_TIME (pin_name, meas_type..)` 的type是什么意思？


  | type       | description     |
  |------------|-----------------|
  | CYCLE      | cycle time mode |
  | HIGH_PULSE | high pulse mode |
  | LOW_PULSE  | low pulse mode  |
  | Type       | integer         |
  | No entry   | CYCLE mode      |

* [ ] 24. `SET_TFTM_MODE(pin_name, trigger_mode );` 这个mode是什么意思？
  >SCHMITT_OFF :trigger source from PEL signal **施密特关闭**
  >SCHMITT_ON :trigger source from PEL/PEH signal (as Schmitt Trigger) **施密特开启**
* [X] 25. FRZ_ON / FRZ_OFF :
  >FRZ_ON&nbsp;&nbsp;:默认,非动作工位judge_pat时,通道不会执行向量.注意,此设定会增加测试时间.
  >FRZ_OFF:非动作工位judge_pat时,通道会运行向量, site by site串行运作就导致多次执行向量.
* [X] 26. `RESULT_PIN` 和`RESULT_PIN_MS`的区别？
  >这个就是写法的区别，
  >第一种要指定读哪个site给到哪个变量，指定了site.
  >第二种就不用指定直接按照site的顺序给到数组里面，获取所有的site的.
* [ ] 27. `READ_PIN_INC`干嘛的? 和 `PIN_INC` 有什么区别？
* [ ] 28. `RESULT_PIN_EX` `MIN_RESULT_PIN_EX` `MAX_RESULT_PIN_EX`这种带EX的是什么意思？"
* [x] 29. 是否可以将测试代码写待c文件还是只能写在pln文件?.
  >编译的时候只能写到pln， Make wizard 程序只能检测到pln文件

## 1.1. SMART 原则


| No. | 描述                         | Code name    |
|-----|----------------------------|--------------|
| 1.  | 目标必须是具体的             | （Specific）   |
| 2.  | 目标必须是可以衡量的         | （Measurable） |
| 3.  | 目标必须是可以达到的         | （Attainable） |
| 4.  | 目标必须和其他目标具有相关性 | （Relevant）   |
| 5.  | 目标必须具有明确的截止期限   | （Time-based） |

## 1.2. 学习计划

* [X] 2021/01/03前。简单的了解并学习维护手册。
* [X] 2021/01/07前，完成操作手册的阅读。以便对Chroma有深入的认识和了解。
  * [ ] 对文中的一些问题，咨询Terry等，进行答疑.
* [X] 2021/01/12前，学习并熟悉Chroma的操作。并进行简单的编码调试。
  * [ ] 咨询Terry/Stock 进行快速的解答和入门
* [ ] 2021/01/25前，学习Chroma的语法和编程的方法。并在AC5121的HQA 的基础上做一些简单开发。
* [ ] 2021/02/05前，整理Chroma的简单使用手册，并罗列相关的注意事情。整理成文。
* [ ] 主要关注用户如何进行使用。

# 2. 注意事项

# 3. chroma 3380p 学习指南

- [1. Todo](#1-todo)
  - [1.1. SMART 原则](#11-smart-原则)
  - [1.2. 学习计划](#12-学习计划)
- [2. 注意事项](#2-注意事项)
- [3. chroma 3380p 学习指南](#3-chroma-3380p-学习指南)
  - [3.1. Chroma 是做什么的](#31-chroma-是做什么的)
  - [3.2. 338X 测试系统的维护](#32-338x-测试系统的维护)
  - [3.3. 操作指南](#33-操作指南)
    - [3.3.1. 上电指南](#331-上电指南)
    - [3.3.2. 下电顺序](#332-下电顺序)
  - [3.4. 编写测试程序](#34-编写测试程序)
    - [3.4.1. 测试程序的组成](#341-测试程序的组成)
    - [3.4.2. 测试程序的编写](#342-测试程序的编写)
    - [3.4.3. 编译PLN测试程序](#343-编译pln测试程序)
    - [3.4.4. 编译Pattern 文件](#344-编译pattern-文件)
    - [3.4.5. 使用编译向导进行操作](#345-使用编译向导进行操作)
  - [3.5. 测试程序执行和调试](#35-测试程序执行和调试)
    - [3.5.1. 使用AE windows 进行测试](#351-使用ae-windows-进行测试)
      - [3.5.1.1. 加载测试程序（Load program）](#3511-加载测试程序load-program)
      - [3.5.1.2. 卸载测试程序（Unload program）](#3512-卸载测试程序unload-program)
    - [3.5.2. PE/FE](#352-pefe)
  - [3.6. 测试调试](#36-测试调试)
    - [3.6.1. Plan Debuger](#361-plan-debuger)
    - [3.6.2. 设置断点](#362-设置断点)
      - [3.6.2.1. 设置诊断数据点](#3621-设置诊断数据点)
      - [3.6.2.2. 设置Override 标志](#3622-设置override-标志)
      - [3.6.2.3. 设置Histogram  标志](#3623-设置histogram--标志)
      - [3.6.2.4. 设置Mask  标志](#3624-设置mask--标志)
      - [3.6.2.5. 设置Trigger  标志](#3625-设置trigger--标志)
    - [3.6.3. Debug 窗体的其他视图](#363-debug-窗体的其他视图)
    - [3.6.4. 调试按钮](#364-调试按钮)
  - [3.7. 数据日志单元（Data Log Utility）](#37-数据日志单元data-log-utility)
    - [3.7.1. Data Log Output Format](#371-data-log-output-format)
    - [3.7.2. AC Data Log Output Format (PATTERN)](#372-ac-data-log-output-format-pattern)
    - [3.7.3. DC Data Log Output Format (PMU/PPMU/DPS/PREF)](#373-dc-data-log-output-format-pmuppmudpspref)
    - [3.7.4. PREF](#374-pref)
    - [3.7.5. DPS/UVI/PPMU](#375-dpsuvippmu)
    - [3.7.6. JUDGE_FREQ/JUDGE_TIME](#376-judge_freqjudge_time)
  - [3.8. 程序顺序控制器](#38-程序顺序控制器)
    - [3.8.1. 常用](#381-常用)
  - [3.9. Pattern 编辑器](#39-pattern-编辑器)
  - [3.10. Shmoo Plot](#310-shmoo-plot)
  - [3.11. Logic Waveform](#311-logic-waveform)
  - [3.12. Scope Waveform](#312-scope-waveform)
  - [3.13. 通道定位（Channel Debug）](#313-通道定位channel-debug)
  - [3.14. Production ID Setup（生成CHIP ID）](#314-production-id-setup生成chip-id)
  - [3.15. 统计工具](#315-统计工具)
  - [3.16. AWI(Analog Waveform Generator/Waveform Digitizer)](#316-awianalog-waveform-generatorwaveform-digitizer)
    - [3.16.1. 波形产生 (Waveform Generator)](#3161-波形产生-waveform-generator)
      - [3.16.1.1. Sine 波形](#31611-sine-波形)
      - [3.16.1.2. Ramp 梯度 波形](#31612-ramp-梯度-波形)
    - [3.16.2. 波形数字化 (Waveform Digitizer)](#3162-波形数字化-waveform-digitizer)
    - [3.16.3. WD rawdata 模式](#3163-wd-rawdata-模式)
    - [3.16.4. WD DNL function](#3164-wd-dnl-function)
    - [3.16.5. WD INL function](#3165-wd-inl-function)
    - [3.16.6. WD AC function](#3166-wd-ac-function)
  - [3.17. TMU](#317-tmu)
- [4. 入门基础知识](#4-入门基础知识)
  - [4.1. 管脚定义的类型](#41-管脚定义的类型)
  - [4.2. 测试程序的源文件定义](#42-测试程序的源文件定义)
    - [4.2.1. DEC 文件](#421-dec-文件)
      - [4.2.1.1. PIN_LIST](#4211-pin_list)
      - [4.2.1.2. PIN_GROUP](#4212-pin_group)
      - [4.2.1.3. POWER_PIN_GROUP](#4213-power_pin_group)
      - [4.2.1.4. UR_PIN_GROUP](#4214-ur_pin_group)
      - [4.2.1.5. TIME_NAME_DEF](#4215-time_name_def)
      - [4.2.1.6. LEVEL_NAME_DEF](#4216-level_name_def)
  - [4.3. PAT 文件](#43-pat-文件)
  - [4.4. PLN 文件的格式](#44-pln-文件的格式)
    - [4.4.1. SET_DEC_FILE](#441-set_dec_file)
    - [4.4.2. HW_BIN_DEF](#442-hw_bin_def)
    - [4.4.3. SW_BIN_DEF](#443-sw_bin_def)
    - [4.4.4. 特殊功能函数](#444-特殊功能函数)
      - [4.4.4.1. START_UP( )](#4441-start_up-)
      - [4.4.4.2. TEST_PRO {...}](#4442-test_pro-)
      - [4.4.4.3. RELEASE()](#4443-release)
      - [4.4.4.4. CONDITION_SET](#4444-condition_set)
      - [4.4.4.5. SPEC_DEF() {...}](#4445-spec_def-)
    - [4.4.5. TEST_NO()](#445-test_no)
    - [4.4.6. DATALOG_MSG()](#446-datalog_msg)
    - [4.4.7. WAIT()](#447-wait)
    - [4.4.8. GLOBAL](#448-global)
  - [4.5. 使用技巧](#45-使用技巧)
  - [4.6. workshop 准备](#46-workshop-准备)
    - [4.6.1. 芯片FT测试是干什么的？](#461-芯片ft测试是干什么的)
    - [4.6.2. Chroma 是干嘛的？](#462-chroma-是干嘛的)
      - [4.6.2.1. 资源的介绍](#4621-资源的介绍)
    - [4.6.3. LoadBoard 是如何设计的？](#463-loadboard-是如何设计的)
    - [4.6.4. 程序编写](#464-程序编写)

## 3.1. Chroma 是做什么的

Chroma 机台是一个集合非常多的资源（板卡）的测试仪器。相当于很多电源，万用表，示波器，电流计。频率发生器，波形发生器，时序发生器等仪器组合在一起的一台仪器。
由于芯片管脚是固定的。而不同的板卡是有不同的功能的，因此在一个pin上面测试不同的功能需要的板卡就不同，因此需要使用继电器控制来将各种板卡的资源连接到指定的pin。从而解决测试pin复用的问题。

板子资源主要有以下几种。

* MXPLC(**Logic Pin Control**)

  * AC功能
    > 主要用于产生时序逻辑，最大可达100MHz,DAC分辨率为14bit, PPMU DAC/ADC分辨率为16bit
    >
  * DC 功能
    > 主要用作电压输出，电压比较，可编程负载，可编程电压钳制。
    > 其中，VIH/VIL -1.9V to +6.0V/-2.0V to +5.9V.
    >
* MXDPS(**Device Power Supply**)

  * 电源供电模块
    > DAC 分辨率是16bit。range 从4v到16v，低电压下最大电流可大2A,精度±(0.1%+1mV)
    >
  * 电流模式
    > DAC 分辨率是16bit. range 从100uA 到2A, 分辨率最低是3.81nA()
    >
  * 电流测试模式(18bit ADC)
    > Range 从1uA 到2A，分辨率最小是11.7pA，精度为±(1%+5nA)
    >
  * 电压测试模式(18bit ADC)
    > Range 从4V 到16V，分辨率最小是31.25uV，精度为±(1%+1mV)
    >
  * 钳制电流电压模式
  * 恒流负载模式
* MXPMU(**Precision Measurement Unit**)

  * ±6~48V
  * ±1uA~100mA
* MXREF(**Pin Voltage Reference**)
* SQPG(**equential Pattern Generator**)

  > 时序系列发生器
  >

  ![SQPG Block Diagram](image/note/SQPG_Block_Diagram.png)

  * MXPG3
* MXBUS(**Tester Bus**)

  > ST-Bus子系统的主要目的是提供一组应用程序编程接口(API)来读/写数据从/到特定地址位置测试头上硬件子系统,并生成一组预定义的ST-Bus-protocol信号每个测试硬件子系统的测试负责人返回飞机PCB。
  >
* MXUVI(**Universal Voltage/Current**)

  > 通用电压电流测试。
  >
* MXAWI(**ADDA**)

  * 4通道波形发生器，4通道波形数字化仪。
  * 带有16位任意波形发生器的50MHz。
  * 兼容Chroma 3380/ 3380p系列ATE通用插槽接口。
  * Chroma 3380/3380PCRAFT软件支持测试计划、测试模式和GUI工具。
  * 全模式同步触发工作方案。

## 3.2. 338X 测试系统的维护

系统应该周期性的进行维护，一般一个月一次。
尤其是一下两个情况需要进行校准的：

* 环境条件被改变。如移动房间。
* 硬件资源被改变。如增删板卡。
* 校准的时候需要一个Keysight 34410A, 34410A,34461A, 3458A  万用表

## 3.3. 操作指南

### 3.3.1. 上电指南

* 打开电脑，用户名：admin密码：root
* 按下3380P机台的绿色ON按钮
* 打开电脑桌面上的CRAFT软件
* 点击ON按钮，等待机台上电完成
* 等待ATE Starter显示上电完成，并有新弹窗显示Board信息(预计需要6分钟)
* Board电压信息是否显示为绿色正常状态，除LB RLY 5V外
* 登录System Controller工具进行开发，用户名：app密码：app

### 3.3.2. 下电顺序

* Unload程式
* 点击CRAFT的OFF按钮
* 等待LOG打印出Fans Stopped的指令
* 电脑右下角右键退出CRAFT软件，要退出CRAFT软件再按集团红色OFF按钮，否则鼠标会锁住
* 按下机台的红色OFF按钮

## 3.4. 编写测试程序

### 3.4.1. 测试程序的组成

我们在桌面环境下，编译后的程序一般都是`.exe`结尾。Chroma 测试程序是以`.pin` 结尾的。相当于我们编写的embedded 程序`bin`。
Chroma 使用C 或者C++ 进行编程。以及一些特定的文件。要想编译出`.pin` 文件，主要有三个部分组成。

1. `.pln` 文件，也叫`Test Plan Program`，其实可以理解为C/C++文件。主要是测试流程的编写和资源的控制。
2. `.pat` 文件，也叫`Test Pattern Program`，这就是常说的 Pattern 文件。相当于最底层的**原子操作**。
   > `pat` 文件编写的是对IO 管脚最直接的控制。以读写寄存器为例， CPU mode 的协议是有时序的要求。对CLock的速度等是有规定的。Pattern能够非常精细实现的对资源和芯片直接操作控制。
   >
3. `.dec` 文件。也叫`Declaration file`，是对芯片管脚的定义。
   > 每个芯片都有独特的PIN Map. 因此不同的芯片，在使用机台的时候，连接方式都是不一样的。因此我们就需要定义不同的管教对应的资源的IO 号。当然在编写dec 文件之前，芯片和机台的大部分连接关系都是确定好的。也就是说`Load board` 是提前做好了。他决定了`.dec` 文件是如何编写的.
   >

![测试程序结构](image/note/test_plan_components.png)

### 3.4.2. 测试程序的编写

任何文档编辑器都可以编写代码。就好像我们可以选择各种各样的编辑器编写芯片驱动程序一样。

一个测试程序。是至少包含上述的三个文件。

### 3.4.3. 编译PLN测试程序

&emsp;&emsp;因为`pln` 文件其实本质上就是C/C++ 文件。因此，在很多方便和我们平常时候编码c语言等是一样的。

* 以下是编译pln （单个/多个）文件的命令。

  ```shell
  plncmp xxx1.pln xxx2.pln ...
  ```

  在同一目录下，测试计划二进制文件`.pin`同时产生。
* 就像C语言一样，使用额外包含的文件或库非常简单。使用-Idirectory指示额外包含文件目录的位置，使用-Ldirectory指示额外库目录的位置。当使用额外库时，需要添加库文件名。
  以下是和lib等一起编译的的命令

  ```
  plncmp xxx1.pln xxx2.pln yyy.lib ...
  ```

### 3.4.4. 编译Pattern 文件

pattern 文件可以说是chroma 特有的文件。可以说pattern文件存储的就是时序和IO的操作。
要想让pattern文件被执行，同样需要编译为object的文件。

![pattern_components.png](image/note/pattern_components.png)

pattern 文件需要专门的编译工具进行编译。具体操作可以看操作手册 page 34.

同样也知道使用命令行进行编译。上面我们知道`.pln`文件使用的编译命令就是`plncmp`,而`.pat` 使用的编译命令就是`patcmp`.

```shell
patcmp xxx1.pat xxx2.pat  ...
```

下面是一些编译的参数：
![pattern_components_args.png](image/note/pattern_components_args.png)

### 3.4.5. 使用编译向导进行操作

使用脚本进行编译可以自定义很多动作，这为编程提供了很多的便利性，但是，普通情况下。使用编译向导是简单的和方便的。
打开编译向导之后。可以按照以下的步骤进行操作。

1. 选择源代码的目录
2. 界面会自动扫描出pln文件。请勾选需要编译的pln计划。
3. 如果有一些lib文件。也请选择lib的位置。
4. 界面会自动扫描出pat的文件。请勾选需要编译的pattern文件。
5. 勾选一些编译选项和输出的文件等信息。

通过这样的操作。就可以生成一个专门的makefile 文件。这也是和c/c++是类似的。
一般情况下。除非没有什么文件新增和大改动，都不需要重新进行编译向导。直接执行makefile就可以完成编译。

> **在使用向导生成makefile后，可以更容易地更快地构建项目，包括多个测试计划文件和模式文件。**

## 3.5. 测试程序执行和调试

主界面提供三个工作界面，来适应不同的工作阶段的需求。分别有**AE**,**PE**和 **FE**.
其中：

* AE(Application Engineer): 主要用于进行程序的开发和调试。
* PE(Production Engineer): 主要用于批量的搭建和模拟。
* PE(Field Engineer): 主要用于量产阶段。

具体的区别主要如下：
![program_execute_wins.png](image/note/program_execute_wins.png)
![program_execute_wins2.png](image/note/program_execute_wins2.png)

### 3.5.1. 使用AE windows 进行测试

一下操作，假定`pin`文件已经编译成功。

#### 3.5.1.1. 加载测试程序（Load program）

1. 使用AE界面，点击`Load`加载`pin` 二进制文件。
2. 选择此目标文件后，会弹出另一个对话框，列出加载板名称、条件名称和规格名称。与加载板名称相关联的是物理接口连接，它使程序显示与用于连接测试头和DUT(被测设备)的硬件的关系。
3. 选择测试条件后，就可以看到主界面被激活。
   ![select_test_plan.png](image/note/select_test_plan.png)

#### 3.5.1.2. 卸载测试程序（Unload program）

点击`Unload` 就可以卸载测试程序。主要用于跟换测试程序或者关机等等。

### 3.5.2. PE/FE

使用方法和AE 类似

## 3.6. 测试调试

除了编写测试程序之外。最麻烦点在于如何进行调试。

### 3.6.1. Plan Debuger

Chroma 由于其特殊性，因此调试过程比较麻烦。不像普通的c/c++ 调试程序那样，直接debug起来就可以。

需要进行调试的时候。需要使用`Plan Debug`进行调试。
一下是一些常用概念:


No. | Function            | description
----|---------------------|----------------------------------------------------------------------------------------------------------------------------------------
1   | Start               | Start of a test plan program execution.
2   | Stop                | Stop of a running test plan program.
3   | Abort               | Pause of a running test plan program (the program can continue execution).
4   | Loop                | Continue to execute the current line statement. 5StepExecution of the plan program line by line.
6   | Re-execute          | Returning one line from the breakpoint, and execution of the 1 step.
7   | Category display    | Display the current category of each site.
8   | Item display        | Display the last test item of each site.1
9   | Source list display | Displays the test plan program source list and permits break, datalog, override and setup 1-step execution relative to the source list.
10  | Break On            | Sets a point at a running test plan program that is to be temporarily halted.
11  | Break Off           | Cancel the break point setting.
12  | Datalog On          | Set a point at a running test plan program that is to show the datalog.
13  | Datalog Off         | Cancel the datalog point setting.
14  | Override On         | Set a point at a running test plan program that the statement test result is to be ignored.
15  | Override Off        | Cancel the override point setting.
16  | Break On Event      | There are five conditions to be set as break, All, AC Fail, DC Fail, AC Judge and DC Judge.
17  | Extension window    | In this section contains Global, Pin List, Pin Group, Time Set, Pattern Debug and SPEC Define Setting"

需要注意的是，调试过程中不要更改代码。更改后也不会生效。

### 3.6.2. 设置断点

断点是非常常用的功能。因此，官方也预设了多种断点类型，方便用户进行设置。
主要有一下几个类型。

1. AC Fail: 当你的是AC？ 状态。同时judgement 结果fail的时候。如果你勾选了，那么就会进入断点。
2. DC Fail: 当你的状态是DC？的时候。如果judgement结果fail的时候。勾选了就会 进入断点。
3. AC Judge: ?
4. DC Judge: ?
5. Sel all: 选择所有的fail情况。
6. Unsel All: 取消所有的fail情况。

其他断点测试。

1. 通过右键进行测试。
2. 在行号处进行设置。

设置成功后，会在行号处看到 `B` 的标志。

#### 3.6.2.1. 设置诊断数据点

设置方法和设置断点一样，设置成功后会在行号处看到 `D` 的标志。

#### 3.6.2.2. 设置Override 标志

设置方法和设置断点一样，设置成功后会在行号处看到 `O` 的标志。

#### 3.6.2.3. 设置Histogram  标志

设置方法和设置断点一样，设置成功后会在行号处看到 `H` 的标志。
此模式还区分两种模式。分别是 `judge` 模式和`MEAS` 模式。

#### 3.6.2.4. 设置Mask  标志

设置方法和设置断点一样，设置成功后会在行号处看到 `M` 的标志。

#### 3.6.2.5. 设置Trigger  标志

...

### 3.6.3. Debug 窗体的其他视图

1. 全局变量
2. Pin list
3. Pin Group
4. Time Name
5. Level Name
6. Bin Table
7. Pattern Debug
8. Spec Editor
9. Current Active Sites

### 3.6.4. 调试按钮

设置断点后，点击测试，进入调试模式。由于设置了断点。那么程序将会停留在断点处。
此时，我们可以分别使用以下按钮进行调试。

1. `step`: 进行单步执行。
2. `re-exec`: 再次执行当前的语句。**注意。是当前的语句**。也就是重复执行断点的那一行。
3. `Do-loop`: 重复执行当前的语句。**注意。是当前的语句**。也就是重复执行断点的那一行直到点击停止循环。

## 3.7. 数据日志单元（Data Log Utility）

当打算进行测试计划、程序调试或设备评估时，除了通过/失败结果外，还需要测量值。数据日志功能是一种工具，它输出由“`judge`”或“`meas`”指令所测量的值。数据日志工具显示测试判断结果和每个DUT的插座或引脚的值。有以下数据日志：

- DC data log
  DC 系统的judge 指令和Mean 指令
- AC data log
  AC 系统的judge指令
- EOT result log
  当“测试结束”事件发生时，显示每个被测试DUT插座的判断结果摘要(通过/失败，HW/SW类别，等等)。

需要注意的格式

### 3.7.1. Data Log Output Format


No. | Item              | Description
----|-------------------|---------------------------------------------------------------------------------------------
(1) | P/F               | Show the measurement judgment result.1.Pass: Pass (conforming).2.Fail: Fail (nonconforming).
(2) | Test No.          | Measurement test number.
(3) | Judge No.         | Judge number of a measurement test number.
(4) | Test Type         | Show the test type used for measurement.FUNC (pattern name)
(5) | Socket No.        | Show the measurement target DUT socket number.
(6) | File/Line/Message | Show the fail occurrence pattern file name, line number and message for commen

### 3.7.2. AC Data Log Output Format (PATTERN)

**AC** 指的是交流，也就是波形判断的。如ADC code 经过编码之后的输出。

当测试计划遇到JUDGE_PAT()语句时，并且打开了输出开关(请参阅上一节“使用参数设置列”)，Datalog视图窗口将显示如下判断结果。下表列出了每个格式项的说明。如果通过判断结果,项目7/9格式将不会显示


No.  | Item                | Description
-----|---------------------|------------------------------------------------------------------
(7)  | Test Count          | Show the fail occurrence pattern execution step (cycle) value.
(8)  | Fail Address        | Show the fail occurrence pattern internal relative address value.
(9)  | Fail PIN            | Show the fail occurrence pin name.
(10) | Mask Flag           | Show character ‘m’ if this pin had been masked.
(11) | Fail pattern symbol | Refer to Language Manual for pattern symbol’s description.

以下图为例：

![AC_LOG](image/note/ac_log.png)

### 3.7.3. DC Data Log Output Format (PMU/PPMU/DPS/PREF)

当测试计划运行到JUDGE_X_PMU()语句时，并且打开了输出开关(参见上一节“使用参数设置列”)，将在Datalog视图窗口中显示如下判断结果。下表列出了每个格式项的说明


No.  | Item           | Description
-----|----------------|------------------------------------------------------------------------------------------------------------------------
(7)  | Pin_name       | All PMU relay connected pins will be showed here.
(8)  | Force          | Applied force value for the measurement process (with VFIM, IFVM, VMM indicated for discrimination purposes).测量过程中施加的力值
(9)  | Low            | Lower-limit value for the measurement process.
(10) | Measured       | Measured value.
(11) | Clamp Flag     | If any “Clamp” happened
(12) | High           | Upper-limit value for the measurement process.
(13) | Min Low Limit  | Lower-limit value for Min measure value
(14) | Min Measure    | Min measure value of all measure values
(15) | Max High Limit | Upper-limit value for Max measure value
(16) | Max Measure    | Max measure value of all measure values

以下图为例:

![dc-log](image/note/dc_log.png)

### 3.7.4. PREF

当测试计划运行到JUDGE_X_PREF()语句时，并且打开了输出开关(参见上一节“使用参数设置列”)，将在Datalog视图窗口中显示如下判断结果。下表列出了每个格式项的说明。


No.  | Item           | Description
-----|----------------|------------------------------------------------------------------------------------------------------------
(7)  | Pin_name       | Show PREF resource by pin_name which pin_type is PREF. (Refer to Language Manual for PIN_LIST description.)
(8)  | Force          | Applied force value for the measurement process (with IFVM and VMM indicated for discrimination purpose).
(9)  | Low            | Lower-limit value for the measurement process.
(10) | Measured       | Measured value.
(11) | High           | Upper-limit value for the measurement process.
(12) | Clamp Flag     | If any “Clamp” happened
(13) | Min Low Limit  | Lower-limit value for Min measure value
(14) | Min Measure    | Min measure value of all measure values
(15) | Max High Limit | Upper-limit value for Max measure value
(16) | Max Measure    | Max measure value of all measure values

以下图为例:

![dc-log](image/note/pref_log.png)

### 3.7.5. DPS/UVI/PPMU

结构类似，测试的主要是直流电源
请参考操作手册。

### 3.7.6. JUDGE_FREQ/JUDGE_TIME

结构类似。测试的是时间和频率相关的参数
请参考操作手册。

## 3.8. 程序顺序控制器

当程序开发完成之后，可以在程序顺序控制器中进行设置，以便进行更好的程序控制和测试。
以下是一些常用的功能。


No. | Function             | Description                                                                 | 描述
----|----------------------|-----------------------------------------------------------------------------|---------------------------
(1) | Active Condition     | Change active condition at run-time, this affects running-sequence.         | 在运行时更改活动条件，这会影响运行顺序。
(2) | Before Test Function | Specify that plan program use or does not use before-test function.         | 指定计划程序使用或不使用测试前功能。
(3) | After Test Function  | Specify that plan program use or does not use after-test function.          | 指定计划程序使用或不使用测试后函数。
(4) | Item Repeat Count    | Specify how many times the selected item run.                               | 指定所选项目的运行次数。
(5) | Item Command         | Specify what type the selected item run, provide test, override and skip.   | 指定所选项目运行、提供测试、重写和跳过的类型。
(6) | Sequence Redefine    | Change the execution-sequence of plan.                                      | 更改计划的执行顺序。
(7) | Command All On       | If any test item fails, next test item in execution-sequence will continue. | 如果任何测试项失败，执行序列中的下一个测试项将继续。
(8) | Undo/Redo Function   | Support Undo/Redo function when user modifies the sequence                  | 支持撤销/重做功能，当用户修改顺序

### 3.8.1. 常用

1. 改变激活状态(Active Condition)
2. 是否启用测试前和测试后特定函数的执行
3. 测试函数的循环次数(item repeat count)
4. 改变测试的指令,有`执行测试`、`跳过测试`,`结束测试`
5. 测速顺序重定义,（Sequence Redefine）
6. 保存、加载测试顺序配置文件。

## 3.9. Pattern 编辑器

pattern 编辑器，对HQA 不是很重要，可能会接触的主要是读写寄存器和一些时序的操作。因此这方面并不需要掌握。

## 3.10. Shmoo Plot

HQA 用不着。不用管。

## 3.11. Logic Waveform

逻辑波形是将测试模式(刺激模式)的判断结果与设备实际输出模式结合起来，通过显示波形图像来表示。

其实说的就是数字的模型。类似时序等。

HQA 使用也不多，暂时不需要掌握。

## 3.12. Scope Waveform

示波器波形就像一个示波器，它显示几乎实际(取决于您的设置)的引脚波形。

可以说，这个就是一个管脚的示波器，当我们使用它进行定位和调试的时候，才可能需要用到它。

在使用它之前，请先进行`Plan debugger` 窗体是`READY`,`BREAK`的状态。

## 3.13. 通道定位（Channel Debug）

通道调试是一个计划程序测试条件的调试工具，它为测试硬件在单个引脚上提供参考和建立测试条件设置的手段。


No. | Function                  | Description                                     | Description
----|---------------------------|-------------------------------------------------|----------------
1   | Site selection            | Select an operation target site.                | 选择操作目标站点。
2   | Pin Mode reference/change | Reference, change the pin mode of a single pin. | 参考，修改单个引脚的引脚模式。
3   | Timing reference/change   | Reference, change the timing of a single pin.   | 参考，改变一个单一引脚的时间。
4   | Level reference/change    | Reference, change the level of a single pin.    | 参考，改变单个引脚的水平。
5   | Relay reference/change    | Reference, change the relays of a single pin.   | 参考，改变继电器的单个引脚

<center>Table 15-1Channel Debug Function List</center>

打开窗体，可以看到一个最基础的IO 连接的示意图。在定位中可以查看参数并且测量。

![pin_debug_window.png](image/note/pin_debug_window.png)

## 3.14. Production ID Setup（生成CHIP ID）

生产ID设置工具提供了用户友好的界面，生产工程师可以设置测试程序到一个包号;这被称为“生产ID”或“PID”，可由操作员直接加载用于批量生产。操作员不需要了解测试程序在哪里，也不需要设置什么条件，他只需要加载生产工程师已经设置好的计划生产ID。生产ID设置窗口基本上分为三个主要部分

- (1) PID数据库操作界面窗口
- (2) 一个PID记录的内容窗口和TDO输出设置
- (3) 加载或备份的按钮区

这个是干嘛用的，不知道啊？

## 3.15. 统计工具

尚不需要了解

## 3.16. AWI(Analog Waveform Generator/Waveform Digitizer)

AWI工具是一个提供模拟波形发生器(WG)和波形数字化仪(WD)功能的实用工具。

AWI工具有三个主要功能：


No. | Function                | Description                                                                                                                                                                                              |
----|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------
1   | Waveform Generator (WG) | (1)Generate Sine / Ramp waveform.<br/>(2)Saving the generated waveform to aWG(*.awi) file.<br/>(3)Loading the saved WG file and redisplaying the waveform.                                               | (1)生成正弦/斜坡波形。<br/>(2)保存生成的波形到aWG(*.awi)文件。<br/>(3)加载保存的WG文件，重新显示波形。
2   | Waveform Digitizer (WD) | (1)Loading the raw data and getting the corresponding values of INL, DNL, THD, SND,SNR and THD+N.<br/>(2)Reading the raw data of the LXAWI Pin.<br/>(3)Displaying the raw data as WD_AC / WD_DC spectrum | (1)加载原始数据，得到相应的INL、DNL、THD、SND、SNR和THD+N值。<br/>(2)读取LXAWI Pin的原始数据。<br/>(3)原始数据显示为WD_AC / WD_DC频谱

<center>Table 20-1Functions of the AWI Tool</center>

### 3.16.1. 波形产生 (Waveform Generator)

波形产生器。可产生：

- Sine 波形。
- Ramp梯度波形。
  波形是模拟信号，主要用于测试需要灌入信号的测试，如 `ADC`, `LF` 等。

通过工具生成的文件其实就是一个xml格式的文件。

#### 3.16.1.1. Sine 波形

图示： 使用恒等式，设置波形的频率 $f_t$ 和采样频率 $f_s$，以及`Offset`,`Amplitude`,以及`初始 Phase`。
![wg_config](image/note/wg_config.png)

输入频率(Ft)、采样率(Fs)和周期数，点击“更新正弦波”按钮，用户就可以得到相应的“采样点”数和正弦波数。

其中Ft为测试信号频率，Fs为采样率，Cycle为测试信号周期，Samples为采样点。注意，“样本”是不可编辑的。

#### 3.16.1.2. Ramp 梯度 波形

图示：设置起始值，终止值，点数。阶梯的重复个数。
![wg_config](image/note/wg_config_ramp.png)

阶梯重复个数为`2`表示为：同一个电压会持续两个点。也就是2个Period。

### 3.16.2. 波形数字化 (Waveform Digitizer)

加载WD数据后，有DNL、INL、原始数据等功能供用户选择。

### 3.16.3. WD rawdata 模式

加载并查看元素数据。可以查看最大值，最小值。

### 3.16.4. WD DNL function

加载文件的 `DeviceLSB`、`Min_DNL`和`Max_DNL`值将显示在`DeviceLSB`、`Min_DNL`和`Max_DNL`字段中。

### 3.16.5. WD INL function

加载文件的 `Device LSB`、`Min_INL`和`Max_INL`值将显示在`Device LSB`、`Min_INL`和`Max_INL`字段中。

同时。INL  还支持获取`GE(gain error)`和`OE(offset error)`,但是，这个只针对 **斜坡波形（Ramp Wave）** 有效。对~~SINE wave~~  无效。
加载斜坡波的原始数据后，检查“增益/偏移误差信息”，然后填写“满量程”和“零量程电压”，用户就可以得到“增益误差”和“偏移误差”的值。

### 3.16.6. WD AC function

有“汉宁(Hanning)窗”、“汉明(Hamming)窗”和“矩形(Rectangular)窗”。选择不同的“加权窗口”，可以得到不同的“`THD`”、“`SND`”、“`SNR`”和“`THD+N`”值，这些值会显示在频谱上方的字符串网格上。

- THD: 总谐波失真（Total harmonic distortion）
- SND: 信噪失真率
- SNR: 信噪比（signal-to-noise ratio）
- THD+D: 总谐波失真噪声和 (total harmonic distortion plus noise)

![wd_ac_window.png](image/note/wd_ac_window.png)

这些功能非常适合用来测试ADC 等需要额外计算的模块。

## 3.17. TMU

TMU viewer 可以查看管脚的波形等信息，并显示在波形文件上面。以便进行观察和定位。

TMU查看器显示了由`READ_TMU_LOG_MEM_BLOCK` 语句转储的 `PF_data`、`PEL_data`和`PEH_data`的结果，并通过显示波形图像来指示它们。使用之前，请验证`READ_TMU_LOG_MEM_BLOCK`语句已经被测试过。

![tmu_viewer.png](image/note/tmu_viewer.png)

# 4. 入门基础知识

## 4.1. 管脚定义的类型


Type  | Description                                  | Description
------|----------------------------------------------|------------------
IN    | Pin used as input pin to the DUT.            | 引脚用作DUT的输入引脚。
OUT   | Pin used as output from the DUT.             | 被测单元输出的引脚。
IO    | Pin used as bi-directional (I/O) by the DUT. | 被DUT用作双向(I/O)的引脚。
MLDPS | Pin is a DUT Power Supply.                   | 引脚是DUT电源。
DPS   | Pin is a DUT Power Supply.                   | 引脚是DUT电源。
UVI   | Pin is a DUT Power pin.                      | 引脚是DUT的电源引脚。
PREF  | Pin is a DUT Power pin.                      | 引脚是DUT的电源引脚。
TMU   | Time measurement unit pin.                   | 时间测量单元引脚。
UR    | Utility Relay pin                            | 效用继电器销
TRG   | Trigger Pin.                                 | 触发销。
GND   | Pin is a DUT Ground pin.                     | DUT接地线。
WG    | Waveform Generator                           | 波形发生器
WD    | Waveform Digitize                            | 波形数字化

## 4.2. 测试程序的源文件定义

在前面有简单的介绍。一个测试程序包含至少3个文件，分别是`DEC`,`PLN`和`PAT` 文件。

其中：

* DEC: 该文件定义了DUT pin码和ATE pin码、pin名和pin组名之间的对应关系。计划程序和模式程序可以使用这个文件中定义的名称。
* PLN: 计划程序定义了一个测试流程，该流程决定了测试项目的执行顺序，包括直流测试、功能测试和交流测试，并通过测试功能控制整个测试顺序。
* PAT: 模式程序使用原始模式语言来描述每个pin的模式数据和期望值数据。模式文件必须与计划程序文件分开。在模式文件中，用户定义波形格式和模式。

### 4.2.1. DEC 文件

DEC 文件定义的就是ATE 的机台和LoadBoard之间的连接关系。

#### 4.2.1.1. PIN_LIST

简单的理解：
`管脚的名字`=`ATE 端口号`=`DUT 的channel序号`=`管脚的类型`。

如果存在多个SITE 的话，在中间插入另外一个site的端口号。
`管脚的名字`=`ATE 端口号`:`ATE 端口号(其他site)`=`DUT 的channel序号`=`管脚的类型`。

下面是4个site的定义。

```
PIN_LIST(AC7801_LQFP48_4Site)
{
    //pin_name =  ate_pin [:ate_pin] = dut_pin = pin_type ;
    //    clk = 10 = 0 = IO ;
    // 注意，多个site 用“:” 进行分割。
    PAD_PB11     = 49 : 17  : 464 : 500 = 1 = IO ;
    PAD_PB12     = 50 : 463 : 465 : 492 = 2 = IO ;
    PAD_PB0      = 45 : 454 : 469 : 509 = 3 = IO ;
    ...
}
```

其中，我们可以理解4个site的 `PAD_PB11` 分别连接到ATE的端口`49`,`17`,`464`,`500`,他作为芯片的第`1`个管脚，是一个普通的`IO`类型。

#### 4.2.1.2. PIN_GROUP

PIN group就是定义不同的集合为一类IO. 还支持`+`，`-`。
主要注意的是：

- IN 和O

```
PIN_GROUP
{
    CTRL = CLR+SEL0+SEL1+G1+G2+SL+SR;
    SEL01 = SEL0+SEL1;
    QQ = QA+QB+QC+QD+QE+QF+QG+QH;
}
```

#### 4.2.1.3. POWER_PIN_GROUP

定义供电的管脚，定义的方式和 [4.2.1.2. PIN_GROUP](#4212-PIN_GROUP) 类似。

#### 4.2.1.4. UR_PIN_GROUP

定义继电器（user relay）的管脚，定义的方式和 [4.2.1.2. PIN_GROUP](#4212-PIN_GROUP) 类似。

```
PIN_LIST ( LS299_4_Sites )
{
    SEL0  = 0   : 288 : 320 : 352 = 1  = IN ;
    ...
    QH    = 5   : 293 : 325 : 357 = 16 = IO ;
    Vdps  = 576 : 577 : 578 : 579 = 21 = DPS ;
    UR_C0 = 0   : 1   : 2   : 3   =    = UR ;
    UR_C1 = 4   : 5   : 6   : 7   =    = UR ;
}

UR_PIN_GROUP
{
    UR_all =UR_C0 + UR_C1 ;
}
```

需要注意的是，**UR 并不是芯片的管脚**，所以你可以看到UR_C0 和UR_C1 是没有定义`chip pin num`的。

#### 4.2.1.5. TIME_NAME_DEF

```
TIME_NAME_DEF
{
  TM1= 1; // Define timing set 1 name is "TM1" for Test plan ( *.pln file )use;
}

```

配合`RATEN` 一起使用: 在指定的时间集数内，语句加载率值将值加载到内存。

#### 4.2.1.6. LEVEL_NAME_DEF

为“计划文件”中的level语句使用的level编号分配一个名称。
(级别名会显示在`TCM IO-Pin level_set`上，以增加可读性)

定义一些名字，别名，用来设置IO 的电平等。
需要配合`SET_LEVELN` 使用。

```
LEVEL_NAME_DEF
{
  rst_lvl  = 1;
  os_lvl   = 2;
  func_lvl = 3
```

如:

```
SET_LEVELN(func_lvl, IO_ALLPINS, 0V, 5V, 0.5V, 2.4V, 150uA, -150uA, 2.5V, , );
```

## 4.3. PAT 文件

* RPM   : Random Pattern Memory
* SPM   : Sequence Pattern Memory
* SSQPG : Sequential Pattern Generator
* SYSCLK: System Clock

一个PAT文件包含以下三个部分。

1. SET_DEC_FILE "Device definition file"
2. HEADER
3. PATTERN

可以认为，PAT 是对时序最直接的定义。
一行一个周期的定义。

* SET_DEC_FILE：定义了声明文件名及其所在的目录。
* HEADER:该块定义了以pin为基础，由实际二进制信息的输入顺序和显示顺序所使用的声明。
* Pattern:这个块定义了模式函数和格式。

以下是一个非常简单的例子。

1. pin.dec 定义的了各pin的名称和端口号。
2. HEADER 规定了 `SPM_PATTERN` 中的每个pin。
3. SPM_PATTERN 定义最原始的高低电平等。一行默认一个周期。

```
SET_DEC_FILE "pin.dec"
HEADER          PAD_PB11,PAD_PB12,PAD_PB0,PAD_PB1,PAD_PA12,
                PAD_PA15,PAD_PA0,PAD_PA1,PAD_PB13,PAD_PB3,
                PAD_PA2,PAD_PA3,PAD_PA4,PAD_PA5,PAD_PA6,
                PAD_PB14,PAD_PB15,PAD_PC0,PAD_PC1,PAD_PB4,
                PAD_PB5,PAD_PA7,PAD_PA8,PAD_PC2,PAD_PC3,
                PAD_PA9,PAD_PC4,PAD_PB6,PAD_PC5,PAD_PB7,
                PAD_PB8,PAD_PA10,PAD_PA11,PAD_PC6,PAD_PC7,
                PAD_PC8,PAD_PC9,PAD_PB9,PAD_PB10,PAD_PB2,
                PAD_PA13,PAD_RESET_B,PAD_PA14;

SPM_PATTERN(write_register_template){
write_addr:
  * XXXXXX11XX11XX1XXXXXXX0XX1XXXXX00XXXXXXX111 * TS1;  /* 2279 *///write address start,//addr[3:2]
  * XXXXXX11XX11XX1XXXXXXX0XX0XXXXX00XXXXXXX111 * TS1;  /* 2280 *///addr[7:4]
  * XXXXXX11XX11XX1XXXXXXX0XX0XXXXX00XXXXXXX111 * TS1;  /* 2281 *///addr[11:8]
  ...
}

```

从代码可以看出。
从pin.dec 里面引入`PAD_PB11`,`PAD_PB12`等。
然后`write_register_template` 这个pattern中。第一行表示，`PAD_PB11` 输出x,`PAD_PB12`输出x，以此类推。

Pattern 还有很多细节。但是HQA很多都是写测试逻辑，因此不用太掌握此内容。
Pattern需要掌握的难点主要是微指令。

## 4.4. PLN 文件的格式

chroma 测试最常用和最必须的掌握的部分。大部分测试流程都在这里。设置测试条件、执行直流参数测试和功能测试以及控制整个测试序列。


区域                 |                                                                                                               |
---------------------|---------------------------------------------------------------------------------------------------------------|-------------------------------------
SET_DEC_FILE         | pin角的定义                                                                                                   | SET_DEC_FILE "declaration file name"
HW_BIN_DEF           | 该块指示了与实际硬件箱相关联的用户名。                                                                         |
SW_BIN_DEF           |                                                                                                               |
**START_UP**(){ … }  | 特殊功能函数, 当测试第一次完成时，或者在菜单请求时自动调用它                                                   |
**TEST_PRO** {….}    | 是一个声明和测试程序的实际主体(它取代了通用C程序中的`main`)。它定义了测试序列以及容器策略(包括硬件和软件容器)。 |
**RELEASE**(){ … }   | 特殊功能函数,  默认下电功能。   它在程序释放时被自动调用                                                       |
**TEST_ITEM1**(){….} | 该块是实际的测试程序。[注意]: TEST_ITEM名称必须小于64个字符。                                                   |
                     |                                                                                                               |

这是一个最基本的PLN 文件的结构
![pln_file_struct.png](image/note/pln_file_struct.png)
**特别提醒：**
必须为每种设备和每种测试方法编写测试程序。如

> 一个测试一个pat 文件和pln文件。

### 4.4.1. SET_DEC_FILE

相当于c/c++的 `include <xxx.h>`，主要就是为了引入pin的定义。

```c
SET_DEC_FILE ".\PAT\FW_ls299_4sites_pin.dec"
```

### 4.4.2. HW_BIN_DEF

bin  是在测试中，芯片fail的原因的不同进行分配到不同的类别中。

通常情况下，我们定义1为全部pass。其他为fail的情况。比如我们定义一个GPIO openshort测试不通过的问题。我们可以这样定义。

```
HW_BIN_DEF{
  all_pass     =  1;
  gpio_os_fail = !2;
  ...
  other_fail   = !255;// 最大是255
}
```

之后，如果测试到os有问题的时候，就会将这个芯片分类到**gpio_os_fail** 这个bin中。

### 4.4.3. SW_BIN_DEF

测试厂一般只用HW_BIN_DEF.
软件bin一般情况下可能是按照功能进行区分。如硬件是ok的。只是功能或者性能不是很好。所以进行区分。
定义和HW_BIN_DEF 一样。

```
SW_BIN_DEF{
  all_pass         = 1;
  SYS_ALARM_SW_BIN = !2;
  ...
  other_fail       = !1023;// 最大是255
}
```

### 4.4.4. 特殊功能函数

#### 4.4.4.1. START_UP( )

* 系统软件在第一次按下测试按钮时自动调用它。
* 您只需要声明这个函数，它就会被系统调用。当然，START_UP id也像任何其他函数一样，因此也可以被测试程序调用。
* 这个函数是设置任何条件的理想场所，这些条件应该在程序使用的剩余时间内保持不变。这是加载测试模式的理想位置。
* 任何测试语句都允许在这个函数中，但是递归是不可能的，不要在函数中调用START_UP。

#### 4.4.4.2. TEST_PRO {...}

测试流程函数是一个非常重要的特殊函数。
此函数定义了测试流程，测试项和测试项之间的测试关联等。

格式如下：

```
TEST_PRO
{
 BEFORE_TEST : before_test_function ;
 test_item# ? passdo : faildo ,
 ...
 test_item# ? passdo : faildo ;
 AFTER_TEST : after_test_function ;
}
```

一下是一个测试例子。以这个AC5121 的例子进行讲解。

```
TEST_PRO
{
  BEFORE_TEST:test_start;

  /*  test item      ? pass_do                   : fail_do ; */
  os_test_to_GND     ?                           : #C(hw_fail_os_test , sw_fail_os_test);
  os_test_to_VDD     ?                           : #C(hw_fail_os_test , sw_fail_os_test);

  HPBG_test          ?                           : #C(hw_fail_function, sw_fail_os_test);
  Current_V2I_test   ?                           : #C(hw_fail_function, sw_fail_os_test);

  ...

  RF_REG_test        ?                           : #C(hw_fail_function, sw_fail_RF_REG_test) ;
  LFOSC_LPOSC_test   ?                           : #C(hw_fail_function, sw_fail_LFOSC_LPOSC_test) ;
  XOSC               ?                           : #C(hw_fail_function, sw_fail_xosc_frequency) ;
  last_item_test     ? #C(all_pass, all_pass)    : #C(fail_last_item_test, fail_last_item_test);
  AFTER_TEST:test_end;
}
```

* BEFORE_TEST : 测试前会执行的函数（`before_test_function`）。例子中，会执行 `test_start`。
* test_item#  : 测试项目。例子中有很多测试项。 `os_test_to_GND`, `os_test_to_VDD`, `HPBG_test`。
* passdo      : 如果当前测试pass，需要执行的动作。例子中，大部分都不需要做任何事情。只有在最后一个测试项项目的时候（last_item_test），执行了。`all_pass` 函数。
* faildo      : 同理，如果fail了，需要执行的动作。例子中。`os_test_to_GND`  测试fail 了会后，执行 **分bin** 的动作。`hw_fail_os_test , sw_fail_os_test`
* AFTER_TEST  : 测试完成后，执行 `after_test_function` 动作。 如。例子中。`AFTER_TEST`测试完成后，执行`test_end`函数。

#### 4.4.4.3. RELEASE()

在程序被释放之后，会执自动执行一个函数。如要执行对芯片的下电情况。这个函数之后是一个默认的关机函数。

#### 4.4.4.4. CONDITION_SET

测试分很多种情况。如高低温测试等、因此机台支持条件设置。当选择某个条件时。执行指定的动作。
如校准一般只有在常温下做。但高低温不做，所以可以通过测试条件来确定要执行的动作。

当负载测试程序时，我们选择一个条件来分配三个系统环境变量(PART/JOB/ENV)。用户可以使用"`GetPART`"， "`GetJOB`"和"`GetENV`"回读字符串。

```
CONDITION_SET
{
  IF_NO_CONDITION : (PART = NOCOND, JOB=nomal   , ENV= nomal);
  IF_ROM1         : (PART = ROM1  , JOB=ROM1_JOB, ENV=ROM1_ENV);
  IF_ROM2         : (PART = ROM2  , JOB=ROM2_JOB, ENV=ROM2_ENV);
  IF_ROM3         : (PART = ROM3  , JOB=ROM3_JOB, ENV=ROM3_ENV);
}


test_start()
{
  if(IF_ROM1)printf("device code=%s,JOB=%s,ENV=%s\n",IF_ROM1.GetPART(),IF_ROM1.GetJOB(),IF_ROM1.GetENV());
  if(IF_ROM2)printf("device code=%s,JOB=%s,ENV=%s\n",IF_ROM2.GetPART(),IF_ROM2.GetJOB(),IF_ROM2.GetENV());
  if(IF_ROM3)printf("device code=%s,JOB=%s,ENV=%s\n",IF_ROM3.GetPART(),IF_ROM3.GetJOB(),IF_ROM3.GetENV());
  LEVELS(rst_lvl,5mS) ;
  RELAY_OFF(IO_ALLPINS,ALL,1mS);

  FORCE_V_DPS ( Vddd, 0V, @8V, @100uA, 100uA, NORM, OFF, 1mS);
  FORCE_V_PREF( Vdd, 0V, @6V, @100uA, 100uA, NORM, OFF, 1mS);
}

```

这个例子中,

#### 4.4.4.5. SPEC_DEF() {...}

有些情况下。需要卡不同的spec进行测试筛选。 因此需要方便的切换不同的SPEC 以便快速进行筛选。
如需要筛选某一个模块性能更好的芯片。那么就使用更严格的spec定义进行测试.

```
SPEC_DEF (spec_table_name) {
 Var_type var_name = min_value : typ_value : max_value ;
 . . . . .
 Var_type var_name = min_value : typ_value : max_value ;
}
```

其中：

* **Var_type**: `TIME`, `CURRENT`, `VOLTAGE`, `FREQUENCY` or `double`.
* **var_name**： 自定义。如BG_VOLT
* **min_value,typ_value,max_value**: 对应spec的最小值、典型值、最大值。1%如`1.188:1.2:1.212`。

以下两个不同的SPEC,`FT_Test`和`QC_Test` 对idd的电流就有不同的要求.

```
SPEC_DEF ( FT_Test) {
  VOLTAGE vdd = 4.5V : 5.0V : 5.5V ;//SPEC min : typical : max ;
  VOLTAGE vddd = 4.5V : 5.0V : 5.5V ;
  ...
  VOLTAGE vref = 1.8V : 1.8V : 1.8V ;
  CURRENT idd = 22mA : 35mA : 50mA ;
}


SPEC_DEF (QC_Test) {
  VOLTAGE vdd = 4.5V : 5.0V : 5.5V ;
  VOLTAGE vddd = 4.5V : 5.0V : 5.5V ;
  ...
  VOLTAGE vref = 1.8V : 1.8V : 1.8V ;
  CURRENT idd = 30mA : 35mA : 42mA ;
}
```

SPEC 定义后的使用。

```
JUDGE_I_DPS ( Vddd, idd.min, idd.max, 2mS, 32, AVE, 50uS, , );
JUDGE_I_PREF( Vdd, idd.min, idd.max, 2mS, 32, AVE, 50uS, , );
```

### 4.4.5. TEST_NO()

它本身并不影响测试内容。然而，当使用它来识别测试执行的状态时，它提供了极大的便利。
只需要在测试点的地方。添加这个语句即可。

### 4.4.6. DATALOG_MSG()

### 4.4.7. WAIT()

等待时间。比如测试电流都需要等待一段时间。

### 4.4.8. GLOBAL

全局变量,支持所有c类型
以及Chroma 自定义的类型。
Default Value:

类型       | 默认值                                                         | 注释
-----------|----------------------------------------------------------------|---
CURRENT    | Variable with A/a (current) unit declaration                   | 安培
FREQUENCY  | Variable with HZ/hz (hertz) unit declaration                   | 赫兹
TIME       | Variable with S/s (time) unit declaration                      | 秒
VOLTAGE    | Variable with V/v (voltage) unit declaration                   | 伏
RESISTANCE | Variable with OHM/ohm (ohm) unit declaration                   | 欧姆
STRING     | Variable with char array, if no instant then assign to size 15 | 字符
INT        | Variable with integer.                                         | 整数


目录    | 描述
--------|-------------------------------------
4.3.4   | JUDGE_V_MLDPS
4.3     | MLDPS Control Statement
4.3.1   | FORCE_I_MLDPS
4.3.2   | FORCE_V_MLDPS
4.3.3   | JUDGE_I_MLDPS
4.3.5   | MEAS_I_MLDPS
4.3.6   | MEAS_V_MLDPS
4.3.7   | RESULT_MLDPS
4.3.8   | MIN_RESULT_MLDPS
4.3.9   | MAX_RESULT_MLDPS
4.3.10  | RESULT_MLDPS_MS
4.3.11  | MIN_RESULT_MLDPS_MS
4.3.12  | MAX_RESULT_MLDPS_MS
4.3.13  | RESULT_MLDPS_EX
4.3.14  | MIN_RESULT_MLDPS_EX
4.3.15  | MAX_RESULT_MLDPS_EX
4.4     | MLDPS High Speed Function
4.4.1   | LOAD_VI_WAVEFORM (Statement)
4.4.2   | CLEAR_VI_WAVEFORM (Statement)
4.4.3   | SET_VI_WAVEFORM (Statement)
4.4.4   | READ_VI_CAPTURE_MEM_BLOCK (Statement
4.4.5   | MLDPS_FORCE_INC (Micro-instruction)
4.4.6   | MLDPS_MEAS (Micro-instruction)
4.4.7   | MLDPS_SET_VOLT (Micro-instruction)
4.5     | MXDPS Control Statement(Option)
4.5.1   | FORCE_I_DPS
4.5.2   | FORCE_V_DPS
4.5.3   | JUDGE_I_DPS
4.5.4   | JUDGE_V_DPS
4.5.5   | MEAS_I_DPS
4.5.6   | MEAS_V_DPS
4.5.7   | RESULT_DPS
4.5.8   | MIN_RESULT_DPS
4.5.9   | MAX_RESULT_DPS
4.5.10  | RESULT_DPS_MS
4.5.11  | MIN_RESULT_DPS_MS
4.5.12  | MAX_RESULT_DPS_MS
4.5.13  | SET_CONST_CURRENT_LOAD
4.6     | MXUVI Control Statement(Option)
4.6.1   | FORCE_V_UVI
4.6.2   | FORCE_I_UVI
4.6.3   | MEAS_I_UVI
4.6.4   | MEAS_V_UVI
4.6.5   | JUDGE_I_UVI
4.6.6   | JUDGE_V_UVI
4.6.7   | RESULT_UVI
4.6.8   | MIN_RESULT_UVI
4.6.9   | MAX_RESULT_UVI
4.6.10  | RESULT_UVI_MS
4.6.11  | MIN_RESULT_UVI_MS
4.6.12  | MAX_RESULT_UVI_MS
4.7     | MXREF Control Statement(Option
4.7.1   | FORCE_I_PREF
4.7.2   | FORCE_V_PREF
4.7.3   | JUDGE_I_PREF
4.7.4   | JUDGE_V_PREF
4.7.5   | MEAS_I_PREF
4.7.6   | MEAS_V_PREF
4.7.7   | RESULT_PREF
4.7.8   | MIN_RESULT_PREF
4.7.9   | MAX_RESULT_PREF
4.7.10  | RESULT_PREF_MS
4.7.11  | MIN_RESULT_PREF_MS
4.7.12  | MAX_RESULT_PREF_MS
4.8     | Complex Control Statement
4.8.1   | FORCE_VOLT
4.8.2   | MEAS_CURRENT
4.8.3   | JUDGE_CURRENT
4.8.4   | FORCE_CURRENT
4.8.5   | MEAS_VOLT
4.8.6   | JUDGE_VOLT
4.8.7   | SET_DVM_MODE
4.9     | MXPMU Control Statement
4.9.1   | FORCE_I_PMU
4.9.2   | JUDGE_I_PMU
4.9.3   | MEAS_I_PMU
4.9.4   | FORCE_V_PMU
4.9.5   | JUDGE_V_PMU
4.9.6   | MEAS_V_PMU
4.9.7   | PARAL_INC
4.9.8   | PIN_INC
4.9.9   | READ_PIN_INC
4.1     | PPMU Control Statement
4.10.1  | FORCE_V_PPMU
4.10.2  | FORCE_V_PPMU_X
4.10.3  | FORCE_I_PPMU
4.10.4  | FORCE_I_PPMU_X
4.10.5  | JUDGE_I_PPMU
4.10.6  | JUDGE_V_PPMU
4.10.7  | MEAS_I_PPMU
4.10.8  | MEAS_V_PPMU
4.11    | Input & Output Condition Setting
4.11.1  | SET_LEVELN
4.11.2  | LEVELS
4.11.3  | INIT_DRIVE_STATE
4.11.4  | JUDGE_STATE
4.11.5  | RATEN
4.11.6  | MARKERN
4.11.7  | FRUN_CLK
4.11.8  | FRUN_CLK_MODE
4.11.9  | PIN_MODE
4.12    | Relay Setting
4.12.1  | SET_CBIT
4.12.2  | RELAY_ON
4.12.3  | RELAY_OFF
4.13    | Oscillator Function Test
4.13.1  | JUDGE_FREQ
4.13.2  | MEAS_FREQ
4.13.3  | JUDGE_TIME
4.13.4  | MEAS_TIME
4.13.5  | STATUS_PIN
4.13.6  | SET_TFTM_MODE
4.13.7  | OSC_struct
4.13.8  | GET_OSC_CLK_DATA
4.13.9  | SET_OSC_CLK
4.13.10 | OSC_CLK_LOCK
4.13.11 | OSC_CLK_MODE
4.14    | TMU Control Statement
4.14.1  | TMU Pin declare
4.14.2  | SET_TMU_WORK_MODE
4.14.3  | JUDGE_TMU_RESULT
4.14.4  | MEAS_TMU_RESULT
4.14.5  | READ_TMU_LOG_MEM_BLOCK
4.14.6  | TMU_DATA_ARITH
4.14.7  |
4.14.8  |
4.14.9  | CARRAY_DIM
4.15    | Function Test
4.15.1  | JUDGE_PAT
4.15.2  | PAT_CONTINUE
4.15.3  | LOAD_PAT
4.15.4  | VECTOR_EXTRACT
4.15.5  | SET_JUDGE_MODE
4.16    | SOCKET Control function
4.16.1  | GET_ACTIVE_SOCKET
4.16.2  | DISABLE_SOCKET
4.16.3  | ENABLE_SOCKET
4.16.4  | SOCKET_SET
4.16.5  | SOCKET_INC
4.16.6  | POWER_DOWN_FAIL_SITE
4.16.7  | PLAN_RESULT_MS
4.16.8  | JUDGE_RESULT_MS
4.16.9  | BACKUP_PLAN_RESULT
4.16.10 | FAIL_REJUDGE
4.16.11 | ENABLE_SOCKET_EX
4.16.12 | DISABLE_SOCKET_EX
4.16.13 | SOCKET_SET_EX
4.16.14 | GET_ACTIVE_SOCKET_EX
4.16.15 | POWER_DOWN_FAIL_SITE
4.17    | Measure Result Getting
4.17.1  | RESULT_PIN_MS
4.17.2  | MIN_RESULT_PIN_MS
4.17.3  | MAX_RESULT_PIN_MS
4.17.4  | RESULT_PIN
4.17.5  | READ_PIN_INC
4.17.6  | MAX_RESULT_PIN
4.17.7  | MIN_RESULT_PIN
4.17.8  | JUDGE_VARIABLE
4.17.9  | JUDGE_VARIABLE_MS
4.17.10 | RESULT_PIN_EX
4.17.11 | MIN_RESULT_PIN_EX
4.17.12 | MAX_RESULT_PIN_EX
4.18    | Scan Function (Option)
4.18.1  | SCAN PIN Declaration
4.18.2  | Scan Pattern
4.18.3  | SET_SCAN_WORK_MODE
4.19    | ALPG Function (Option)
4.19.1  | ALPG_PIN_GROUP
4.19.2  | ALPG Pattern
4.19.3  | SET_ALPG_WORK_MODE
4.19.4  | ALPG Micro Instruction
4.19.5  | SET_ALPG_HOLDING_REG
4.19.6  | READ_ALPG_REG_COUNTER
4.19.7  | READ_ALPG_LOG_MEM
4.19.8  | SET_ALPG_WORK_MODE_X
4.2     | AWG/Digitizer (Option)
4.20.1  | AWI Pins Declaration
4.20.2  | AWI_HEADER – CRAFT declaration
4.20.3  | LOAD_AWG_PAT
4.20.4  | SET_WG_WORK_MODE
4.20.5  | SET_WD_WAVEFORM_SET
4.20.6  | SET_WD_WORK_MODE
4.20.7  | READ_WD_DATA
4.20.8  | AWI_DATA_AC_ARITH
4.20.9  | AWI_DATA_DC_ARITH
4.20.10 | AWI_SPECTRUM
4.20.11 | WG_PAT_STOP
4.20.12 | LOAD_FOCUS_CAL_FILE
4.20.13 | AWI_SPECTRUM_EX
4.20.14 | AWI_DATA_AC_ARITH_EX
4.21    | Capture Memory
4.21.1  | SET_CAPTURE_MEM_MODE
4.21.2  | READ_CAPTURE_MEM
4.21.3  | READ_CAPTURE_MEM_BLOCK
4.21.4  | READ_CAPTURE_MEM_BLOCK
4.21.5  | SET_ECM_MODE
4.21.6  | READ_ECM_BLOCK
4.21.7  | PRINT_ECM_DATA
4.22    | Shmoo statement
4.22.1  | SET_SHMOO_TG
4.22.2  | SET_SHMOO_LEVEL
4.22.3  | SET_SHMOO_POWER
4.22.4  | RUN_SHMOO
4.22.5  | RUN_SHMOO_EX
4.22.6  | SET_SHMOO_COMPARE
4.22.7  | SET_SHMOO_X(Y)
4.22.8  | SET_SHMOO_COOR
4.23    | MAWI2 Generator / Digitizer
4.23.1  | Architecture
4.23.2  | AWI2 Pins Declaration
4.23.3  | Pattern Form
4.23.4  | LOAD_ADDA_WAVEFORM
4.23.5  | USE_WG_WAVEFORM
4.23.6  | USE_WD_WAVEFORM
4.23.7  | READ_WD_DATA_MS
4.23.8  | WG_RELAY_ON
4.23.9  | WG_RELAY_OFF
4.23.10 | WD_RELAY_ON
4.23.11 | WD_RELAY_OFF
4.23.12 | WG_LS_TRIG
4.23.13 | WD_LS_TRIG
4.23.14 | INIT_WG_STATE
4.23.15 | SET_WG_OFFSET
4.23.16 | ADDA_PARAL_INC
4.23.17 | ADDA_PIN_INC


一级 | 二级  | 标题                    | 解释
-----|-------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4.3  |       | MLDPS Control Statement | MLDPS (Device Power Supply) 控制
     | 4.3.1 | FORCE_I_MLDPS           | 强制输入一个电流，用来测试当前节点的电压，可以为**负值**。如果仅仅想当做万用表使用。FORCE_一个**0uA** 的电流即可。一般用来配合`JUDGE_V_MLDPS`,`MEAS_V_MLDPS` 使用。<br/>`FORCE_I_MLDPS(MLDPS_name, f_curent(目标电流), i_range(范围) v_range(范围), v_clamp(钳制电压), m_mode, ON/OFF(开关), wait_time(等待时间) ;`<br/>```FORCE_I_MLDPS (Vcc, 1mA, @25mA, @12V, 6V, NORM, ON, 2mS);``` <br/>```JUDGE_V_MLDPS(Vcc, 2.9V, 3.1V, 2mS, 32, AVE, 50uS, ,);```
     | 4.3.2 | FORCE_V_MLDPS           | 强制输入一个电流，用来测试当前节点的电压，可以为**负值**。如果仅仅想当做万用表使用。FORCE_一个**0uA** 的电流即可。一般用来配合`JUDGE_V_MLDPS`,`MEAS_V_MLDPS` 使用。<br/>一般用来配合`JUDGE_I_MLDPS`,`MEAS_I_MLDPS` 使用。<br/>FORCE_V_MLDPS(MLDPS_name, f_volt, v_range, i_range, I_clamp, m_mode, ON/OFF, wait_time) ;

## 4.5. 使用技巧

1. 只有官方语句才能打断点。其他情况下无法打断点，只能先添加`DEBUG_BREAK()`;
2. 断点打 `MASK` 代表不自信此语句
3. 支持单步调试。
4. 不支持局部变量。只支持全局变量等。
5. **TCM** 支持实时设置和刷新。需要在debug的时候使用。
6. `printf` 只有在debug的时候才会打印。
7. 可以设置log的输出和繁简。也可以输出csv，输出csv是需要先打出log，然后在输出到csv的。
8. `printf `是不会输出到csv的
9. `make` `build` 之前都需要先使用【make wizard】进行设置之后才能使用。
   1. make值编译修改后的东西。
   2. build 全部编译
   3. load 的程序的时候可以设置pattern 是否每次都要重新load。但是使用build的话。会认为pattern都是全新的，会重新load。
   4. pattern是在机台中的。而测试程序是在电脑上的。
   5. pattern很大的时候，加载要很久。建议少更改和编译。建议只使用make
10. unload pin file before make
11. 测试项目是不能加void 等关键字的。
12. 测试项目一定要在`TEST_PROC` 里面才能识别。
13. 非测试项目的函数。可以添加void float int等关键字。但是添加后不能成为测试项目。
14. 支持调用DLL。但是不知道是`x86` 还是`x64`版本的。
15. 测试电流前需要等一下.

## 4.6. workshop 准备

### 4.6.1. 芯片FT测试是干什么的？

1. 需要测试方法需要什么仪表？
2. 仪表和芯片是如何连接的？
3. 这么多IO 和信号，需要怎么控制。

### 4.6.2. Chroma 是干嘛的？

1. Chroma 是干嘛的？
2. Chroma的资源都有什么？
3. Chroma 和芯片通过什么连接。
4. Chroma 是如何支持多个site的？
5. Chroma 是如何保持是时序的？
   1. Chroma的读写寄存器
   2. Chroma 在生产过程中是又是如何读写寄存器的?
6. Chroma 理解为一个芯片

#### 4.6.2.1. 资源的介绍

1. 电压电流
2. 供电
3. 频率
4. 时间
5. 波形,
6. 模拟信号(ADC/DAC)

### 4.6.3. LoadBoard 是如何设计的？

1. 根据信号，确定需要使用的资源
2. pin脚复用的。需要增加开关，到时候用到的时候进行确定

### 4.6.4. 程序编写

1. 管脚定义

  1. 管脚定义在设计loadboard的时候已经确定
  2. 支持多个site
  3. 管脚组 如power组/ 通信组


2. 寄存器通信

  1. 已经实现了结果
  2. 其实就是按照协议使机台发出信号。
  3. 用只需要调用就好了。


| nihao | ni |
|-------|----|
| ni    | ni |
3. 测试的流程

   1. 上电,
      1. 关闭所有的开关
      2. 给所有的power进行设置电压为0
      3. 开启所有的PCDL 开关
      4. 给power pin上电
      5. 设置`LEVElS` ？
         ![realyon](image/note/relay_on.png)

          ```c{.line-numbers}
            // 关闭所有的继电器等等
            RELAY_OFF(IO_ALLPINS, ALL, 2mS);// 下电
            // 设置为0伏
            FORCE_V_MLDPS(PowerPins, 0.0V, @6V, @500mA, 200mA, NORM, ON, 3mS);
            //开启所有的 PDCL 的开关
            RELAY_ON(IO_ALLPINS, PDCL, 2mS);
            // 给power 上电3.0v
            FORCE_V_MLDPS(PowerPins, 3.0V, @6V, @500mA, 200mA, NORM, ON, 11mS);
            // LEVELs 是什么意思？
            LEVELS(reg_wr_lvl, 1mS);
            WAIT(1mS);

          ```
   1. 进去cpumode的模式
   2.
   3.
