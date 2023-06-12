import React from 'react';
import type { Meta, StoryObj } from '@storybook/react';

import { Label as LabelComponent } from './Label';

const meta: Meta<typeof LabelComponent> = {
    component: LabelComponent,
    title: 'Label',
};
export default meta;

type Story = StoryObj<typeof LabelComponent>;

export const Primary: Story = () => <LabelComponent />;
Primary.args = {};

/* const meta: Meta<typeof LabelComponent> = {
    component: LabelComponent,
};

export default meta; */

/* import React from 'react';
import type { ComponentStory, ComponentMeta } from '@storybook/react';
import { BetaLabel as BetaLabelComponent } from './BetaLabel';

export default {
    title: 'Beta Label',
    component: BetaLabelComponent,
    parameters: {
        // More on Story layout: https://storybook.js.org/docs/react/configure/story-layout
        layout: 'fullscreen',
    },
} as ComponentMeta<typeof BetaLabelComponent>;

const Template: ComponentStory<typeof BetaLabelComponent> = (args) => (
    <BetaLabelComponent {...args} />
);

export const BetaLabel = Template.bind({}); */
